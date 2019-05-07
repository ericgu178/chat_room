<?php
/**
 *                                         ,s555SB@@&                          
 *                                      :9H####@@@@@Xi                        
 *                                     1@@@@@@@@@@@@@@8                       
 *                                   ,8@@@@@@@@@B@@@@@@8                      
 *                                  :B@@@@X3hi8Bs;B@@@@@Ah,                   
 *             ,8i                  r@@@B:     1S ,M@@@@@@#8;                 
 *            1AB35.i:               X@@8 .   SGhr ,A@@@@@@@@S                
 *            1@h31MX8                18Hhh3i .i3r ,A@@@@@@@@@5               
 *            ;@&i,58r5                 rGSS:     :B@@@@@@@@@@A               
 *             1#i  . 9i                 hX.  .: .5@@@@@@@@@@@1               
 *              sG1,  ,G53s.              9#Xi;hS5 3B@@@@@@@B1                
 *               .h8h.,A@@@MXSs,           #@H1:    3ssSSX@1                  
 *               s ,@@@@@@@@@@@@Xhi,       r#@@X1s9M8    .GA981               
 *               ,. rS8H#@@@@@@@@@@#HG51;.  .h31i;9@r    .8@@@@BS;i;          
 *                .19AXXXAB@@@@@@@@@@@@@@#MHXG893hrX#XGGXM@@@@@@@@@@MS        
 *                s@@MM@@@hsX#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&,      
 *              :GB@#3G@@Brs ,1GM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B,     
 *            .hM@@@#@@#MX 51  r;iSGAM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@8     
 *          :3B@@@@@@@@@@@&9@h :Gs   .;sSXH@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:    
 *      s&HA#@@@@@@@@@@@@@@M89A;.8S.       ,r3@@@@@@@@@@@@@@@@@@@@@@@@@@@r    
 *   ,13B@@@@@@@@@@@@@@@@@@@5 5B3 ;.         ;@@@@@@@@@@@@@@@@@@@@@@@@@@@i    
 *  5#@@#&@@@@@@@@@@@@@@@@@@9  .39:          ;@@@@@@@@@@@@@@@@@@@@@@@@@@@;    
 *  9@@@X:MM@@@@@@@@@@@@@@@#;    ;31.         H@@@@@@@@@@@@@@@@@@@@@@@@@@:    
 *   SH#@B9.rM@@@@@@@@@@@@@B       :.         3@@@@@@@@@@@@@@@@@@@@@@@@@@5    
 *     ,:.   9@@@@@@@@@@@#HB5                 .M@@@@@@@@@@@@@@@@@@@@@@@@@B    
 *           ,ssirhSM@&1;i19911i,.             s@@@@@@@@@@@@@@@@@@@@@@@@@@S   
 *              ,,,rHAri1h1rh&@#353Sh:          8@@@@@@@@@@@@@@@@@@@@@@@@@#:  
 *            .A3hH@#5S553&@@#h   i:i9S          #@@@@@@@@@@@@@@@@@@@@@@@@@A.
 *
 *
 *    又看源码，看你妹妹呀！
 */





// 写的有点乱


require 'Redis.php';

// 初始化时删除所有缓存
$keys = "socket:user";
$redis = MyRedis::init();
foreach(allUser() as $k => $v) {
	$redis->hDel($keys . ':' . $v['fd'],['user_id','user_name','client']);
}


/**
 * 拿到所有的用户
 *
 * @return void
 * @author EricGU178
 */
function allUser()
{
	global $redis;
	global $keys;
    $users = [];
	$allkeys = $redis->keys("{$keys}:*");
    // 所有的key
    foreach ($allkeys as $k => $item) {
        $users[$k]['user_id'] = $redis->hGet($item, 'user_id');
        $users[$k]['user_name'] = $redis->hGet($item, 'user_name');
        $users[$k]['fd'] =	$redis->hGet($item, 'client');
	}
    return $users;
}
/**
 * 查询
 *
 * @param string $sql
 * @param string $type
 * @return void
 * @author EricGU178
 */
function query($sql,$type="select")
{
	$mysqli = new mysqli("127.0.0.1", "root", "", "chat_room");
	if (!$result = $mysqli->query($sql)) {
	  die('Error: ' . $mysqli->error);
	}
	$data = [];
	if ($type == 'select') {
		while($row = $result->fetch_assoc()) {
			$data[] = $row;
		}
		return $data;
	} else {
		return $result->fetch_assoc();
	}
	$result->free();
	$mysqli->close();
}

/**
 * 添加一条数据
 *
 * @param array $data
 * @param string $table
 * @return void
 * @author EricGU178
 */
function insert($data,$table)
{
	$field = "";
	$value = "";
	foreach ($data as $key => $v) {
		if (is_string($value)) {
			$value .= "'{$v}'" . ',';
		}
		$field .= $key . ',';
		
	}
	$field = rtrim($field,',');
	$value = rtrim($value,',');
	$sql = "INSERT INTO {$table} ({$field}) VALUES ({$value})";
	echo $sql;
	$mysqli = new mysqli("127.0.0.1", "root", "", "chat_room");
	if (!$result = $mysqli->query($sql)) {
	  die('Error: ' . $mysqli->error);
	}
	return $result;
	$result->free();
	$mysqli->close();
}


//////////////////////////////////////
// 主程序
//////////////////////////////////////

$ws_server = new swoole_websocket_server('127.0.0.1', 9502);

// 初始链接
$ws_server->on('open', function ($ws, $request){
	$user_id = md5($request->server['remote_addr']);
	$sql = "select * from user where user_id = '{$user_id}'";
	$find = query($sql,'find');

	if ($find) {
		$user_name	=	$find['user_name'];
	} else {
		$user_name	=	user_name();
		insert([
			'user_id'	=>	$user_id,
			'user_name'	=>	$user_name,
			'create_time'	=>	time(),
			'update_time'	=>	time(),
			'ip'	=>	$request->server['remote_addr']
		],'user');
	}
	$sql = "select * from chat_content ORDER BY id desc limit 10 ";
	$select = query($sql);
	krsort($select);
	$ws->push($request->fd,json_encode(['user_id'=>$user_id,'user_name'=>$user_name ,'message'=>$user_name.' 连接成功','type'=>0],JSON_UNESCAPED_UNICODE));
	foreach($select as $v) {
		$v['type']	=	2;
		$v['create_time'] = date('Y-m-d H:i:s',$v['create_time']);
		$ws->push($request->fd,json_encode($v,JSON_UNESCAPED_UNICODE));
	}

	global $redis;

	$redis->hMSet('socket:user:' . $request->fd , [
		'user_id'	=>	$user_id,
		'user_name'	=>	$user_name,
		'client'	=>	$request->fd
	]);
	
	$user = allUser();
	foreach ($ws->connection_list() as $key => $value) {
		if ($value != $request->fd) {
			$ws->push($value,json_encode(['eventtype'=>1],JSON_UNESCAPED_UNICODE));
		}
		foreach ($ws->connection_list() as $k => $v) {
			foreach ($user as $kk => $vv) {
				if ($vv['fd'] == $v) {
					$ws->push($value,json_encode(['event'=>$vv['user_name'],'fd'=>$v],JSON_UNESCAPED_UNICODE));
				}
			}		
		}
	}
});
// 收到消息处理
$ws_server->on('message', function ($ws, $frame){

	$message = json_decode($frame->data,true);

	insert([
		'user_id'	=>	$message['user_id'],
		'message'	=>	$message['message'],
		'user_name'	=>	$message['user_name'],
		'create_time'	=>	time(),
		'update_time'	=>	time()
	],'chat_content');


    foreach($ws->connections as $fd) {
		if ($frame->fd == $fd){
			$data = json_encode(['user_id'=>$message['user_id'],'user_name'=>$message['user_name'],'message'=>$message['message'],'type'=>1,'create_time'=>date('Y-m-d H:i:s',time())],JSON_UNESCAPED_UNICODE);
		} else {
			$data = json_encode(['user_id'=>$message['user_id'],'user_name'=>$message['user_name'],'message'=>$message['message'],'type'=>2,'create_time'=>date('Y-m-d H:i:s',time())],JSON_UNESCAPED_UNICODE);
		}
		$ws->push($fd,$data);
	}
});

//监听WebSocket连接关闭事件
$ws_server->on('close', function ($ws, $fd){
	global $redis;
	$user = allUser();

	foreach ($ws->connection_list() as $key => $value) {
		if ($fd != $value) {
			$ws->push($value,json_encode(['eventtype'=>1],JSON_UNESCAPED_UNICODE));
			foreach ($ws->connection_list() as $k => $v) {
				if ($fd != $v) { 
					foreach ($user as $kk => $vv) {
						if ($vv['fd'] == $v) {
							$ws->push($value,json_encode(['event'=>$vv['user_name']],JSON_UNESCAPED_UNICODE));
						}
						if ($fd == $vv['fd']) {
							$down_user_name = $vv['user_name'];
						}
					}
				}
			}
			$ws->push($value,json_encode(['client'=>$fd,'message'=>$down_user_name . '下线了','type'=>3],JSON_UNESCAPED_UNICODE));
		}
	}
	$redis->hDel('socket:user:'.$fd,['user_id','user_name','client']);
});

$ws_server->start();



function user_name()
{
	$names = [
		'石家庄永昌',
		'巴塞罗那Barcelona',
		'皇家马德里Real Madrid',
		'瓦伦西亚Valencia Club de Fotbol',
		'拉科鲁尼亚Deportivo La Coruna',
		'马德里竞技 Club Atlético de Madrid',
		'皇家社会 Real Sociedad',
		'毕尔巴鄂竞技 Athletic Club Bilbao',
		'皇家贝蒂斯 Real Betis Balompie SAD',
		'比利亚雷亚尔 Villareal CF',
		'塞维利亚 Sevilla Fútbol Club',
		'马拉加 Malaga CF',
		'拉斯帕尔马斯 Las Palmas',
		'埃瓦尔 Eibar',
		'塞尔塔 Celta de Vigo',
		'西班牙人 RCD Espanyol',
		'阿拉维斯 Alaves',
		'赫塔菲 Getafe',
		'格拉纳达 Granada CF',
		'巴列卡诺 Rayo Vallecano',
		'希洪 Sporting de Gijón',
		'雷加利斯 Leganes',
		'切尔西',
		'阿森纳足球俱乐部',
		'利物浦足球俱乐部',
		'曼彻斯特曼城',
		'曼彻斯特曼联',
		'拜仁慕尼黑',
		'亚特兰大足球俱乐部',
		'博洛尼亚足球俱乐部',	
		'卡利亚里足球俱乐部',	
		'切沃维罗纳足球俱乐部',
		'恩波利足球俱乐部',	
		'佛罗伦萨足球俱乐部',	
		'弗罗西诺内足球俱乐部',	
		'热那亚足球俱乐部',
		'国际米兰足球俱乐部',	
		'尤文图斯足球俱乐部',	
		'拉齐奥足球俱乐部',	
		'AC米兰足球俱乐部',
		'那不勒斯足球俱乐部',	
		'帕尔玛足球俱乐部',	
		'罗马足球俱乐部',	
		'桑普多利亚足球俱乐部',
		'萨索洛足球俱乐部',	
		'斯帕尔足球俱乐部',	
		'都灵足球俱乐部',	
		'乌迪内斯足球俱乐部',
	];
	shuffle($names);
	return $names[0] . rand(1,9999);
}

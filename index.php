<?php

include 'include/db.php';
$action = $_REQUEST['action'];

switch ($action) {
    case 'login':
        $response = array();
        $username = null;
        $password = null;

        // mod_php
        if (isset($_SERVER['PHP_AUTH_USER'])) {
            $username = $_SERVER['PHP_AUTH_USER'];
            $password = $_SERVER['PHP_AUTH_PW'];

            // most other servers
        } elseif (isset($_SERVER['HTTP_AUTHORIZATION'])) {

            if (strpos(strtolower($_SERVER['HTTP_AUTHORIZATION']), 'basic') === 0)
                list($username, $password) = explode(':', base64_decode(substr($_SERVER['HTTP_AUTHORIZATION'], 6)));
        }
        if (is_null($username)) {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Text to send if user hits Cancel button';
            die();
        } else {
            $selectUserSql = "SELECT * FROM sb_users as u JOIN sb_userinfo as ui on u.id=ui.user_id where u.username='$username' AND user_deleted=0";
            $result = mysql_query($selectUserSql);

            if (!$result) {
                $response['status'] = 'error';
                $response['reason'] = 'Invalid credentials. Please try again.';
            }
            if (mysql_num_rows($result) == 0) {
                $response['status'] = 'error';
                $response['reason'] = 'Invalid credentials. Please try again.';
            } else {
                $data = mysql_fetch_assoc($result);
                if ($data['password'] == sha1($password)) {
                    $response['status'] = 'success';
                    $response['userId'] = $data['id'];
                    $response['userName'] = $data['first_name'];
                    $insertSession = mysql_query("INSERT INTO sb_user_session (`user_id`,`type`,`time`) VALUES ('".$data['id']."','0',NOW())");
                } else {
                    $response['status'] = 'error';
                    $response['reason'] = "Incorrect password. Please try again.";
                }
            }
            echo json_encode($response);
            exit;
        }
        break;
        
        
    case 'getUsers' :
                
                $response = array();
                $selectUsersSql = "SELECT * FROM sb_users JOIN sb_userinfo on sb_users.id = sb_userinfo.user_id where sb_users.user_deleted=0";
                $result = mysql_query($selectUsersSql);

                if (!$result) {
                    $response['data'] = '';
                    $response['reason'] = 'No data found.';
                }
                if (mysql_num_rows($result) == 0) {
                    $response['data'] = '';
                    $response['reason'] = 'No data found.';
                } else {                    
                    while ($row = mysql_fetch_assoc($result)) {
                        $response['data'][] = $row;                        
                    }
                    //echo '<pre>';print_r($response['data']);exit;
                }
                echo json_encode($response);exit;
        break;
    case 'deleteUser':
            $id = $_REQUEST['id'];
            $updateSql = mysql_query("UPDATE sb_users SET user_deleted=1 where id=".$id);
            exit;
        break;
    default:
        break;
}
exit;
?>
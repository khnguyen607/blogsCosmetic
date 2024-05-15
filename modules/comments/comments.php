<?php
require '../../Core/Database.php';

class BaseModel extends Database
{
    private $connect;
    private $action;
    private $sql;
    private function _query()
    {
        return mysqli_query($this->connect, $this->sql);
    }

    public function __construct()
    {
        $this->connect =  $this->connect();
        $this->action = $_POST['action'];
        $this->sql = $_POST['sql'];
    }

    public function main()
    {
        // Thực thi hành động tương ứng
        switch ($this->action) {
            case "select":
                if ($this->isValidSelectSQL()) {
                    return $this->_select();
                } else {
                    return null;
                }
                break;
            case "insert":
                if ($this->isValidInsertSQL()) {
                    return $this->_insert();
                } else {
                    return null;
                }
                break;
            case "update":
                if ($this->isValidUpdateSQL()) {
                    return $this->_update();
                } else {
                    return null;
                }
                break;
            case "delete":
                if ($this->isValidDeleteSQL()) {
                    return $this->_delete();
                } else {
                    return null;
                }
                break;
            default:
                echo "Hành động không hợp lệ!";
        }
    }

    private function isValidSelectSQL()
    {
        return stripos(trim($this->sql), "SELECT") === 0;
    }

    private function isValidInsertSQL()
    {
        return stripos(trim($this->sql), "INSERT INTO") === 0;
    }

    private function isValidUpdateSQL()
    {
        return stripos(trim($this->sql), "UPDATE") === 0;
    }

    private function isValidDeleteSQL()
    {
        return stripos(trim($this->sql), "DELETE FROM") === 0;
    }

    private function _select()
    {
        $query = $this->_query($this->sql);
        if ($query) {
            $data = [];
            while ($row = mysqli_fetch_assoc($query)) {
                array_push($data, $row);
            }
            return $data;
        } else {
            echo "Lỗi khi thực hiện truy vấn insert.";
            return null;
        }
    }

    public function _insert()
    {
        $this->_query($this->sql);
    }

    private function _update()
    {
        $this->_query($this->sql);
    }

    private function _delete()
    {
        $this->_query($this->sql);
    }
}

$controllerObj = new BaseModel;
// Trả về dữ liệu dưới dạng JSON
header('Content-Type: application/json');
$result = $controllerObj->main();
if ($result) {
    echo json_encode($controllerObj->main());
} else {
    echo false;
}

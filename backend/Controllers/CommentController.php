<?php

class CommentController extends BaseController
{
    private $model;

    public function __construct()
    {
        $this->loadModel('CommentModel');
        $this->model = new CommentModel;
    }

    public function index()
    {
        $data = $this->model->mAlls();

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function find()
    {
        $id = $_GET['id'];
        $data = $this->model->mFind($id);
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function insert()
    {
        $data = [
            'Content'      => $_POST['Content'],
            'userID'      => $_POST['userID'],
            'blogID'      => $_POST['blogID'],
        ];
        if (isset($_POST['parentCommentID']) && $_POST['parentCommentID'] != "null") $data['parentCommentID'] = $_POST['parentCommentID'];
        $this->model->mInsert($data);
        echo "true";
    }

    public function update()
    {
        $id = $_GET['id'];
        $data = [
            'Name'      => $_POST['Name']
        ];

        $this->model->mUpdate($id, $data);

        echo "true";
    }

    public function delete()
    {
        $id = $_GET['id'];
        $sql = "DELETE FROM `comments` WHERE parentCommentID=$id";
        $this->model->_query($sql);
        if ($this->model->mDelete($id)) {
            echo "true";
        } else {
            echo "false";
        }
    }

    public function allsFK()
    {
        $data = $this->model->mAllsFK();

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }
}

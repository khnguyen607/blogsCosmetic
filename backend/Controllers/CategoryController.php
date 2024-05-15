<?php

class CategoryController extends BaseController
{
    private $categoryModel;

    public function __construct()
    {
        $this->loadModel('CategoryModel');
        $this->categoryModel = new CategoryModel;
    }

    public function index()
    {
        $rooms = $this->categoryModel->mAlls();

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($rooms);
    }

    public function insert()
    {
        $data = [
            'Name' => $_POST['Name']
        ];

        if ($this->categoryModel->mInsert($data)) {
            echo "true";
        } else {
            echo "false";
        }
    }

    public function delete()
    {
        $id = $_GET['id'];
        if ($this->categoryModel->mDelete($id)) {
            echo "true";
        } else {
            echo "false";
        }
    }
}

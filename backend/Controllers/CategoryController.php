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
            'name' => $_POST['name']
        ];

        $this->categoryModel->mInsert($data);
        header("Location: ../frontend/admin/category.html");
    }

}

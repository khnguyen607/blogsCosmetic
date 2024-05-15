<?php

class BlogController extends BaseController
{
    private $model;
    public function __construct()
    {
        $this->loadModel('BlogModel');
        $this->model = new BlogModel;
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
            'Name'      => $_POST['Name'],
            'Subtitle'  => $_POST['Subtitle'],
            'Content'      => $_POST['Content'],
            'userID'  => $_POST['userID'],
            'Img'   => $this->saveFile()
        ];
        $blogID = $this->model->mInsert($data);

        $selected_categories = $_POST['category_id'];
        if (!empty($selected_categories)) {
            foreach ($selected_categories as $category_id) {
                $sql = "INSERT INTO 
                        `syn_blogs_categories`(`categoryID`, `blogID`) 
                        VALUES ($category_id, $blogID)";
                $this->model->_query($sql);
            }
        }
        echo "true";
    }

    public function update()
    {
        $id = $_GET['id'];
        $data = [
            'Name'      => $_POST['Name'],
            'Subtitle'  => $_POST['Subtitle'],
            'Content'      => $_POST['Content'],
            'userID'  => $_POST['userID'],
        ];
        $Img = $this->saveFile();
        if ($Img) $data["Img"] = $Img;

        $selected_categories = $_POST['category_id'];
        if (!empty($selected_categories)) {
            $sql = "DELETE FROM `syn_blogs_categories` WHERE `blogID` = $id";
            $this->model->_query($sql);
            foreach ($selected_categories as $category_id) {
                $sql = "INSERT INTO 
                        `syn_blogs_categories`(`categoryID`, `blogID`) 
                        VALUES ($category_id, $id)";
                $this->model->_query($sql);
            }
        }

        $this->model->mUpdate($id, $data);
        echo "true";
    }

    public function delete()
    {
        $id = $_GET['id'];
        $this->model->mDelete($id);
        header("Location: ../frontend/dashboard.html?tab=mgr__room");
    }


    public function getComments()
    {
        $id = $_GET['id'];
        $data = $this->model->mGetComments($id);
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function getCategories()
    {
        $id = $_GET['id'];
        $data = $this->model->mGetCategories($id);
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    private function saveFile()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['Img'])) {
            // Thư mục đích để lưu trữ tệp tin
            $uploadDirectory = 'www/blogs/';

            // Tên tệp gốc trên máy khách
            $filename = basename($_FILES['Img']['name']);

            // Đường dẫn đầy đủ đến tệp tạm thời trên máy chủ
            $tempFilePath = $_FILES['Img']['tmp_name'];

            // Tạo đường dẫn đầy đủ đến vị trí lưu trữ tệp tin
            $targetFilePath = $uploadDirectory . $filename;
            // Di chuyển tệp tin từ thư mục tạm thời đến thư mục đích
            if (move_uploaded_file($tempFilePath, $targetFilePath)) {
                // Trả về đường dẫn của tệp tin đã được lưu
                return substr($targetFilePath, 4);
            } else {
                // echo "Failed to upload file.";
            }
        } else {
            // echo "No file uploaded or invalid request.";
        }
        return null;
    }

    public function getAllsFK()
    {
        $data = $this->model->mGetAllsFK();

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }
}

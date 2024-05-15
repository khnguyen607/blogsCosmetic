<?php

class CommentModel extends BaseModel
{
    const TABLE = 'comments';

    public function mAlls($select = ['*'])
    {
        return $this->bmAlls(self::TABLE, $select);
    }

    public function mFind($id)
    {
        return $this->bmFind(self::TABLE, $id);
    }

    public function mInsert($data)
    {
        return $this->bmInsert(self::TABLE, $data);
    }

    public function mUpdate($id, $data)
    {
        return $this->bmUpdate(self::TABLE, $id, $data);
    }

    public function mDelete($id)
    {
        return $this->bmDelete(self::TABLE, $id);
    }

    public function mAllsFK()
    {
        $sql = "SELECT comments.*, users.Name AS userName, blogs.Name AS blogName
                FROM comments
                INNER JOIN users ON comments.userID = users.ID
                INNER JOIN blogs ON comments.blogID = blogs.ID;";
        $query = $this->_query($sql);
        $data = [];

        while ($row = mysqli_fetch_assoc($query)) {
            array_push($data, $row);
        }

        return $data;
    }
}

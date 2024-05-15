document.addEventListener('DOMContentLoaded', async () => {
    _addComment()
    _getComment()
})

async function _getComment() {
    var comments = await Helper.fetchData(
        'select',
        `select comment.*, users.username
        from comment
        inner join users on comment.user_id=users.user_id
        where baiviet_id=${Helper.getParameter('baiviet_id')}
        order by comment.comment_id`
    )
    var commentsList = document.querySelector(".commentsList")
    var commentsItem = document.querySelector(".commentsItem").cloneNode(true)
    commentsList.innerHTML = ""
    if (comments) {
        comments.forEach(item => {
            var itemClone = commentsItem.cloneNode(true)
            itemClone.setAttribute('data-commentId', item.comment_id)
            itemClone.querySelector(".card-title").textContent = item.username
            itemClone.querySelector(".card-text").textContent = item.content
            itemClone.querySelector("small.text-muted").textContent = Helper.formatDate(item.Ngaydang)

            itemClone.querySelector("._btnReply").addEventListener('click', function () {
                replyBtn = this.nextElementSibling;
                replyBtn.classList.toggle("d-none");
            });

            itemClone.querySelector(".input-group button").addEventListener('click', async () => {
                var commentContent = replyBtn.querySelector("input").value
                var user_id = 1
                var parent_comment_id = item.comment_id
                var baiviet_id = Helper.getParameter('baiviet_id')
                Helper.addComment(commentContent, user_id, parent_comment_id, baiviet_id)
            })
            
            if (item.parent_comment_id) {
                commentsList.querySelector(`.commentsItem[data-commentId='${item.parent_comment_id}']`).appendChild(itemClone)
            } else {
                commentsList.appendChild(itemClone)
            }
        });
    }
}

async function _addComment() {
    document.querySelector("#commentButton").addEventListener('click', () => {
        var commentContent = document.querySelector("#commentMessage").value
        var user_id = 1
        var parent_comment_id = "NULL"
        var baiviet_id = Helper.getParameter('baiviet_id')
        Helper.addComment(commentContent, user_id, parent_comment_id, baiviet_id)
    })
}

class Helper {
    // Tương tác dataBase
    static async fetchData(action, sql) {
        const formData = new FormData();
        formData.append('action', action);
        formData.append('sql', sql);

        const requestOptions = {
            method: 'POST',
            body: formData
        };

        return fetch("modules/comments/comments.php", requestOptions)
            .then((response) => response.json())
            .then((data) => {
                return data;
            })
            .catch((error) => {
                console.log(error);
                return null;
            });
    }

    // Lấy biến get của trình duyệt
    static getParameter(name) {
        var queryParams = new URLSearchParams(window.location.search);
        if (queryParams.has(name)) {
            return queryParams.get(name);
        }
        return null;
    }

    static formatDate(inputDateStr) {
        var dateObj = new Date(inputDateStr);

        var day = dateObj.getDate();
        var month = dateObj.getMonth() + 1; // Tháng bắt đầu từ 0
        var year = dateObj.getFullYear();

        var hours = dateObj.getHours();
        var minutes = dateObj.getMinutes();

        var period = hours >= 12 ? 'PM' : 'AM';

        hours = hours % 12;
        hours = hours ? hours : 12;

        minutes = minutes < 10 ? '0' + minutes : minutes;

        var formattedDate = 'Đã đăng: ' + day + '/' + month + '/' + year + ' ' + hours + ':' + minutes + ' ' + period;

        return formattedDate;
    }

    static async addComment(commentContent, user_id, parent_comment_id, baiviet_id) {
        await Helper.fetchData(
            'insert',
            `INSERT INTO 
            comment(user_id, parent_comment_id, baiviet_id, content) 
            VALUES ('${user_id}',${parent_comment_id},'${baiviet_id}','${commentContent}')`
        )
        location.href = "#commentsList"
        location.reload()
    }
}
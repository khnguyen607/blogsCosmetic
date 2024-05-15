async function defaultFunc() {
    await Helper.fetchBackendLink()
    // hàm hiển thị bài viết 
    function show_category() {
        fetch(Helper.backendLink + '?controller=category')
            .then(response => response.json())
            .then(data => {
                data.forEach(item => {
                    var option = document.createElement('option')
                    option.textContent = item.Name
                    option.value = item.ID
                    document.querySelector('.form-select[name="category_id[]"]').appendChild(option)
                });

                // hàm hiển thị phần edit 
                function show_edit(edit) {
                    document.querySelector('.pagetitle h1').textContent = 'Sửa bài viết'
                    fetch('./backend/index.php?controller=new&action=findNew&id=' + edit)
                        .then(response => response.json())
                        .then(data => {
                            document.querySelector('input[name="title"]').value = data.title
                            document.querySelector('input[name="img"]').value = data.img
                            document.querySelector('select[name="category_id"]').value = data.category_id
                            document.querySelector('.quill-editor-default').innerHTML = data.content
                            new Quill('.quill-editor-default', {
                                theme: 'snow'
                            });
                        })
                }
                var edit = new URLSearchParams(window.location.search).get('edit')
                if (edit) show_edit(edit)
                else {
                    new Quill('.quill-editor-default', {
                        theme: 'snow'
                    });
                }
            })
    }

    function submit__form() {
        document.getElementById('form__news').addEventListener('submit', function (event) {
            event.preventDefault(); // Ngăn chặn form submit mặc định
            // Lấy dữ liệu từ form
            const formData = new FormData(document.getElementById('form__news'));
            formData.append('Content', document.querySelector('.ql-editor').innerHTML)
            formData.append('userID', Helper.getCookie('user_id'))
            // Gửi dữ liệu đến PHP
            var edit = new URLSearchParams(window.location.search).get('edit')
            var url = Helper.backendLink + '?controller=blog&action=insert'
            if (edit) url = Helper.backendLink + 'controller=new&action=editNew&id=' + edit
            fetch(url, {
                method: 'POST',
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        alert('Thêm thành công')
                        location.reload()
                    } else {
                        alert('Thêm thất bại!')
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Xử lý lỗi (nếu cần)
                });
        });

    }

    // thực thi func 
    show_category()
    submit__form()


}

document.addEventListener('DOMContentLoaded', defaultFunc)
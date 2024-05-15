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
                    fetch(Helper.backendLink + '?controller=blog&action=find&id=' + edit)
                        .then(response => response.json())
                        .then(async data => {
                            console.log(data);
                            document.querySelector('input[name="Name"]').value = data.Name
                            document.querySelector('input[name="Subtitle"]').value = data.Subtitle
                            document.querySelector('.quill-editor-default').innerHTML = data.Content
                            new Quill('.quill-editor-default', {
                                theme: 'snow'
                            });

                            var categories = await Helper.fetchData('blog&action=getCategories&id=' + edit)
                            categories.forEach(category => {
                                console.log(category.ID);
                                document.querySelector(`select[name="category_id[]"] option[value="${category.ID}"]`).selected = true
                            })
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
            if (edit) url = Helper.backendLink + '?controller=blog&action=update&id=' + edit
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
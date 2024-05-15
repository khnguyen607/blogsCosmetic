function defaultFunc() {
    var divtoNew = document.querySelector('.user__info').cloneNode(true)
    // hàm hiển thị bài viết 
    function show_user() {
        document.querySelector('.user__list').innerHTML = ''
        fetch(Helper.backendLink + '?controller=user')
            .then(response => response.json())
            .then(data => {
                data = data.filter(item=>{
                    return item.Role == '0'
                })
                data.forEach(item => {
                    var divNew = divtoNew.cloneNode(true)
                    var td = divNew.querySelectorAll('td')
                    td[0].textContent = item.Name
                    td[1].textContent = item.Username
                    td[2].querySelector('a').href = './backend/index.php?controller=user&action=delUser&id=' + item.ID
                    document.querySelector('.user__list').appendChild(divNew)
                });

                new simpleDatatables.DataTable(document.querySelector('.datatabless'), {
                    perPageSelect: [5, 10, 15, ["All", -1]],
                });
            })
    }

    // thực thi func 
    show_user()

}

document.addEventListener('DOMContentLoaded', defaultFunc)
const filterBtn = document.getElementById('filterBtn')
const filterBlock = document.getElementById('filterBlock')

const handleClickOnFilter = event => {
    if(!filterBlock.classList.contains('show')){
        filterBlock.classList.add('show')
    } else {
        filterBlock.classList.remove('show')
    }
}
filterBtn.addEventListener('click',handleClickOnFilter)
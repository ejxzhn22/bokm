const urlParams = new URLSearchParams(window.location.search);
const query = urlParams.get('query');

let pageNum = urlParams.get('pageNum');
let i = pageNum*10;
let limit = pageNum*10+10;
let num = document.getElementById('totalCount').value;
let page = 1;
let pageId = document.getElementById('page');
let next = document.getElementById('next');
let prev = document.getElementById('prev');
if(num>500 ){
    page = 50;
}else{
    page = num/10;
    if(page===0){
        page = 1;
    }
}
window.onload = makePage('onload');

function makePage(tagId){
    
    while(pageId.firstChild){
        pageId.removeChild(pageId.firstChild);
    }
    
    if(tagId=='next'){
    	pageNum++;
        limit = i + 10;

        if(limit>page){
            limit = page;
        }

        for( i = i ; i < limit ; i++){
            let a = document.createElement('a');
            a.classList.add('pageNum');
            a.innerText = i+1;
            pageId.append(a);
        }
    }else if(tagId=='prev'){
    	pageNum--;
        i -= 20;
        limit -= 10;
        if(limit>page){
            limit = page;
        }

        for( i = i ; i < limit ; i++){
            let a = document.createElement('a');
            a.classList.add('pageNum');
            a.innerText = i+1;
            pageId.append(a);
        }
    }else{
    	limit = i + 10;

        if(limit>page){
            limit = page;
        }

        for( i = i ; i < limit ; i++){
            let a = document.createElement('a');
            a.classList.add('pageNum');
            a.innerText = i+1;
            pageId.append(a);
        }
    }

    document.querySelectorAll('.pageNum').forEach(function(num){
        num.addEventListener('click',()=> {
        location.href=`search?query=${query}&page=${num.innerHTML}&pageNum=${pageNum}`;
        })
    })

    let start = pageId.firstChild.innerHTML;
    let end = pageId.lastChild.innerHTML;

    if( end==50 || end==page || page<11){
        next.style.display = 'none';
    } else{
        next.style.display = 'inline';
    }
    if (start!=1){
        prev.style.display = 'inline';
    } else{
        prev.style.display = 'none';
    }
}

next.addEventListener('click',(e) => {
    makePage('next');
});
prev.addEventListener('click',(e) => {
    makePage('prev');
});
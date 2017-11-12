document.querySelector('.read-more').addEventListener('click',function(){document.querySelector('.shop-info').style.height='auto')};
document.querySelector('.read-more').style.display='none';
document.querySelector('.close-button').style.display='block';

document.querySelector('.close-button').addEventListener('click',function(){document.querySelector('.shop-info').style.height='188px')};
document.querySelector('.read-more').style.display='block';
document.querySelector('.close-button').style.display='none';
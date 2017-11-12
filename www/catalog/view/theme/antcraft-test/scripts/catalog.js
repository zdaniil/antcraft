const addFilterEventsHandlingForMobile = () => {
  document.querySelector('.filters-button').addEventListener('click', function(){
  	document.querySelector('.dark-filters').style.display =  'block'
    document.querySelector('.catalog-sidebar').classList.add('catalog-sidebar-open')
  	document.body.classList.add("stop-scrolling")
  	document.querySelector('.hamburger').style.display =  'none'
  })
}
addFilterEventsHandlingForMobile()

document.querySelector('.dark-filters').addEventListener('click', function(){
  	document.querySelector('.dark-filters').style.display =  'none'
 	document.querySelector('.catalog-sidebar').classList.remove('catalog-sidebar-open')
  	document.body.classList.remove('stop-scrolling')
  	document.querySelector('.hamburger').style.display =  'block'
})

 







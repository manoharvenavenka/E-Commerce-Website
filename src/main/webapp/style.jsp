<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

*{/*global one for entire page.*/
    margin: 0;
 padding: 0;
 box-sizing: border-box;
 font-family: 'poppins',sans-serif;
}
.container{
 width: 100%;
 height: 100vh;
 background-image: linear-gradient(rgba(0,0,0,0.3),transparent),url("./images/bc7.webp");
 background-size: cover;
 background-position: center;
 padding: 0 8%;
 position: relative;
}
nav{
    display: flex;
    width: 100%;
    align-items: center;
    flex-wrap: wrap;
    padding: 5px 0;
}
.logo{
    width: 120px;
    cursor: pointer;
}
.cart-icon{
    width: 30px;
    cursor: pointer;
}

nav ul{
    flex: 1;
    text-align: right;
    padding-right: 30px;
}

nav ul li{
    display: inline-block;
    list-style: none;
    margin: 10px 30px;

}
nav ul li a{
    color: #fff;
    text-decoration: none;
    position: relative;
}
nav ul li a::after{
    content: '';
    width: 0;
    height: 3px;
    position: absolute;
    bottom: -5px;
    left: 50%;
    transform: translate(-50%);
    background: white;
    transition: width 0.3s;
}
nav ul li a:hover::after{
   
    width: 85%;
    height: 3px;
    position: absolute;
    bottom: -5px;
    left: 50%;
    transform: translate(-50%);
    background: white;
}
.text-box p{
    font-size: 30px;
    font-weight: 600;
}
.text-box{
    color: white;
    position: absolute;
    bottom: 9%;
}
.text-box h1{
    font-size: 150px;
    line-height: 160px;
    margin-left: -10px;
    color: transparent;
    /*names backgound that means boreder ostay middle lo m undad*/
    -webkit-text-stroke: 1px white;
    background: url('./images/back.png');
    -webkit-background-clip: text;
    background-position: 0 0;
    animation: back 2s linear infinite;
}
@keyframes back{
    100%{
        background-position: 200px 0;
    }
}
.text-box h3{
    font-size: 40px;
    font-weight: 500;
}
.social{
position: absolute;
right: 5%;
bottom: 8%;
}
.social i{
    font-size: 30px;
    color: #fff;
    justify-content: space-evenly;
}





</style>
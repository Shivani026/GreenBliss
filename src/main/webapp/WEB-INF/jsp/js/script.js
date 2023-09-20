
function add_to_cart(pid, pname, pprice, pimg,punits)
{

    let cart = localStorage.getItem("cart");
    if(cart==null)
    {
        let products=[];
        let product={productId:pid, productName:pname, productPrice:pprice, productImg:pimg,productUnits:punits}
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("Product is added for first time")
    }
    else
    {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item)=>item.productId==pid)
        if(oldProduct)
        {
            oldProduct.productUnits = oldProduct.productUnits+1
            pcart.map((item)=>{
                if(item.productId==oldProduct.productId)
                {
                    item.productUnits=oldProduct.productUnits;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased")
        }
        else
        {
            let product={productId:pid, productName:pname, productPrice:pprice, productImg:pimg,productUnits:punits}
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added")

        }
    }

    updateCart();
}


function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart==null || cart.length==0)
    {
        console.log("Cart is empty...")
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart does not have any items...</h3>");
        $(".checkout-btn").attr('disabled', true);

    }
    else
    {

        console.log(cart.length)
        document.getElementsByClassName("cart-items")[0].innerHTML="("+cart.length+")"

        let table =
            "<table class='table'>"+
            "<thead class='thread-light'>"
            +"<tr>"+
            "<th>Item Name</th>"+
            "<th>Product Photo</th>"+
            "<th>Price</th>"+
            "<th>Quantity</th>"+
            "<th>Total Price</th>"+
            "<th>Action</th>"+
            "</tr>"+
            "</thead>";

        let totalPrice =0;


        JSON.parse(localStorage.getItem('cart')).map(item=>{
            table+="<tr>"+
                "<td>"+item.productName+"</td>"+
                "<td><img style='width: 100px;height: 100px;' src="+item.productImg+"></td>"+
                "<td>"+item.productPrice+"</td>"+
                "<td>"+item.productUnits+"</td>"+
                "<td>"+item.productPrice * item.productUnits+"</td>"+
                "<td>"+"<button class='btn btn-danger btn-sm' onclick='deleteItemFromCart("+item.productId+")'>Remove</button>"+"</td>"+
                "</tr>";
            totalPrice += item.productPrice * item.productUnits;

        });

        table = table + "<tr><td colspan='6' class='text-right font-weight-bold m5'> Total Price : "+ totalPrice +"</td></tr>" +"</table"
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
    }
}

function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item)=> item.productId != pid);

    localStorage.setItem('cart',JSON.stringify(newcart));
    updateCart();
}


function goToCheckout()
{
    alert("testing");
}


$(document).ready(function ()
{
    updateCart();
})

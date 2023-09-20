
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="height: auto;width: 600px;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Your cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="cart-body">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary checkout-btn" onclick="checkout()" disabled="true">CheckOut</button>
            </div>
        </div>
    </div>
</div>

<script>
    function checkout()
    {
        window.location.href="checkout";
    }
</script>
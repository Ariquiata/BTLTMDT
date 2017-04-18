<%-- 
    Document   : addtocart
    Created on : Apr 4, 2017, 12:44:06 AM
    Author     : Saber
--%>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Notification</h4>
        </div>
        <div class="modal-body">
          <p>Add to cart success!</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
        <script>
            function addToCart(id) {
            $.ajax({
                type : "GET",
                contentType : "application/json",
                url : "${pageContext.request.contextPath}/addToCart",
                data : {
                    id : id
                },
                dataType : 'json',
                timeout : 100000,
                success : function(data) {
                    console.log("SUCCESS: ", data);
                    if (data != null) {
                        var result = data;
                        $("#item-number").html(result);
                        $(document).ready(function(){
                        $(".myBtn").click(function(){
                             $("#myModal").modal();
                                });
                            });
                    } else {
                        
                    }
                },
                error : function(e) {
                    console.log("ERROR: ", e);
                }
            });
        }
        </script>

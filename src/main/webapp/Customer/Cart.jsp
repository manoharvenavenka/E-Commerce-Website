<%@page import="com.example.model.CustomerMod"%>
<%@page import="com.example.model.CartModel"%>
<%@page import="com.example.model.ProdMod"%>
<%@page import="com.example.model.CatMod"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../head.jsp"></jsp:include>
<style>
#line {
	width: 1px;
	background-color: black;
	height: auto;
}
</style>
<script lang="javscript">
        function text(x) {
            if(x==1)document.getElementById("mycode").style.display = "block";
            else document.getElementById("mycode").style.display = "none";
            return
        }
   

	
		
		   function confirm_delete(cartId) {
               let ans = confirm("Do you want to delete this record?");
                  if (ans) {
                      window.location = "/EcommersProject/DeleteCartServlet?cartId=" +cartId;
   }
 }
		   
		   
		   
		  
		   function calculateBillAmount(amount, gstAmount, rowNo, nRows){
				// alert("ok" + amount);
				// alert(rowNo);
				// function to calculate bill amount, gst, and final amount for a row in the table
				let qty = parseInt(document.getElementById('qty'+rowNo).value);
				
				//alert("qty" + qty);
				let billAmount = amount * qty;
				document.getElementById('billAmount'+rowNo).value = billAmount;// Update the corresponding input fields in the table
				
				let gst =  parseInt(gstAmount) *  qty;
				document.getElementById('gst'+rowNo).value = gst;
				
				let finalAmount=billAmount+gst;
				document.getElementById('finalAmount'+rowNo).value = parseInt(document.getElementById('billAmount'+rowNo).value) + gst;
				
			
				//total calculations
				let totalQty =0;
				let totalBillAmount=0;
				let totalGst=0;//updated total gst
				let totalFinalAmount=0;//updated final amount
				
				for(i=1; i<=parseInt(nRows); i++){
					let currentBillAmount=parseInt(document.getElementById('billAmount'+i).value);
					let currentGst=parseInt(document.getElementById('gst' +i).value);
					let currentFinalAmount=parseInt(document.getElementById('finalAmount'+ i).value);
					
			
					totalQty += parseInt(document.getElementById('qty'+i).value);
					totalBillAmount += currentBillAmount;
					//totalFinalAmount += currentFinalAmount;
					
					//
					totalGst +=parseInt(document.getElementById('gst' +i).value);
					totalFinalAmount +=parseInt(document.getElementById('finalAmount' + i).value);
					
				}
				document.getElementById("totalQty").innerHTML = ""+totalQty;
				document.getElementById("totalBillAmount").innerHTML = "" + totalBillAmount;
				document.getElementById("totalGst").innerHTML= "" + totalGst; 
				document.getElementById("totalFinalAmount").innerHTML = "" +totalFinalAmount;
				document.getElementById("totalFinalAmount1").value = "" +totalFinalAmount;
			}
			
</script>
<style>
</style>

<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../custnavbar.jsp"></jsp:include>
<form name='f1' method='post' action="/EcommersProject/PaymentServlet">
	<div class="container-fluid">
		<div class="row ">

			<br>
			<%
			String res = request.getParameter("res");
			if (res != null) {
				if (res.equals("1")) {
			%>

			<div class="alert alert-danger alert-dismissible" id='success_id'>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<strong>Cart Item!</strong> Removed!!!!
			</div>
			<%
			} else if (res.equals("0")) {
			%>
			<div class="alert alert-danger alert-dismissible" id='success_id'>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<strong>Success!</strong> *.........!
			</div>
			<%
			}
			}
			%>

			<br> <br>
			<%
			//for vewing in the tble code 
			CartModel cart = new CartModel();

			List<ProdMod> ListProducts = cart.getAllCartProductsByCustomerId((int) session.getAttribute("customerId"));
			System.out.print(ListProducts.size());

			System.out.print(ListProducts.size());
			int nRows = ListProducts.size();

			Integer grandTotal = 0;
			int totalQuantity = 0;
			int totalBillAmount = 0;
			int totalGst = 0;
			int totalFinalAmount = 0;
			%>

			


				<div class="col-sm-12">
					<h1 class="text text-center">Cart Items</h1>
										<div class='table-responsive'>
					
					<table class="table mt-5 table-bordered table-hover">
						<thead class='table table-dark'>
							<tr>
								<th>SLNO</th>
								<th>Product Code</th>
								<th scope="col">Product Name</th>
								<th scope="col">Cost</th>
								<th scope="col">Discount(%)</th>
								<th scope="col">Amount</th>
								<th scope="col">Qty</th>
								<th scope="col">Bill Amount</th>
								<th scope="col">GSt</th>
								<th scope="col">Final Amount</th>
								<th scope="col">Operation</th>


							</tr>
						</thead>
						<tbody class='table '>
							<%
							int slno = 0;
							int i = 1;
							for (ProdMod productOb : ListProducts) {

								Integer cost = productOb.getCost();
								Integer discount = productOb.getDiscount();
								Integer amount = cost - (cost * discount / 100);
								Integer total = amount;
								grandTotal += total;
								Integer billAmount = amount;
								Integer gst = (int) (billAmount * (16 / 100.0));
								Integer finalAmount = billAmount + gst;

								totalQuantity += 1;
								totalBillAmount += billAmount;
								totalGst += gst;
								totalFinalAmount += finalAmount;
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=productOb.getProductCode()%></td>
								<td class="text-center"><%=productOb.getProductName()%></td>
								<td class="text-end"><%=productOb.getCost()%></td>
								<td class="text-end"><%=productOb.getDiscount()%></td>
								<td class="text-end"><%=amount%></td>


								<td><input type="number" name="qty<%=i%>" min="1"
									id="qty<%=i%>" class="form-control" value="1"
									onchange="calculateBillAmount(<%=amount%>,<%=gst%>, <%=i%>, <%=nRows%>)"
									style="width: 50px"></td>


								<td><input type="number" name="billAmount"
									id="billAmount<%=i%>" value="<%=billAmount%>"
									class="form-control" style="width: 150px" readonly></td>

								<td><input type="number" name="gst" id="gst<%=i%>"
									value="<%=gst%>" class="form-control" style="width: 150px"
									readonly></td>


								<td><input type="number" name="finalAmount"
									id="finalAmount<%=i%>" value="<%=finalAmount%>"
									class="form-control" style="width: 150px"></td>


								<td>
									<%
									CartModel cart1 = new CartModel();

									CartModel cartId = cart1.getProfileByCartId();
									%>
									<input type="button" class="btn btn-sm btn-danger"
										onclick="confirm_delete(<%=cartId.getCartId()%>)" value="Remove"/>
								</td>
								<%
								i++;
								}
								%>
							</tr>





							<tr>
								<td colspan="5" class="text-end"><strong>Total:</strong></td>
								<td class="text-end"><strong id=''><%=grandTotal%></strong></td>
								<td class="text-end" colspan="1"><strong id='totalQty'><%=totalQuantity%></strong></td>
								<td class="text-end"><strong id='totalBillAmount'><%=totalBillAmount%></strong></td>
								<td class="text-end"><strong id='totalGst'><%=totalGst%></strong>
								<td class="text-end"><strong id='totalFinalAmount'><%=totalFinalAmount%></strong>
									<!-- //hidden form fields for taking total amount values in payment purpose-->
									<input type='hidden' id="totalFinalAmount1"
									name="totalFinalAmount" value="<%=totalFinalAmount%>">
							</tr>
						</tbody>
					</table>
					
					</div>
				</div>
		</div>


		<div class="container-fluid mt-5">
			<div class="row">

				<div class="col-sm-6 " style="margin-top: 5rem;">

					<div class="col-md-9 justify-content-center">
						<div class="card card-custom pb-4">
							<div class="card-body mt-0 mx-5">
								<div class="text-center mb-3 pb-2 mt-3">
									<h4 style="color: #495057;">Shipping Address</h4>
								</div>
								<div class="col">
									<div class="form-outline">
										<label class="form-label" for="deliverAddress">Deliver
											Address</label>
										<textarea name="deliverAddress"
											class="form-control input-custom"></textarea>
									</div>
								</div>
								<div class="col">
									<div class="form-outline">
										<label class="form-label" for="mobileNumber">Mobile
											Number</label> <input type="number" name="mobileNumber"
											class="form-control input-custom" />
									</div>
								</div>
								<div class="col">
									<div class="form-outline">
										<label class="form-label" for="zipCode">Zip Code</label> <input
											type="number" name="zipCode"
											class="form-control input-custom" />
									</div>
								</div>





							</div>
						</div>
					</div>
				</div>


				<div class="col-sm-6 mt-5">

					<div class="col-md-9 justify-content-center mt-4">
						<div class="card card-custom pb-4">
							<div class="card-body mt-0 mx-5">
								<div class="text-center mb-3 pb-2 mt-3">
									<h3 style="color: #495057;">Payment</h3>
								</div>


								<div class="text-center mb-3 pb-2 mt-3">
									<h4 style="color: #495057;">Payment Type</h4>
								</div>
								<div class="row mb-4">
									<div class="col">
										<div class="form-outline">
											<label class="form-label" for="form9Example1">Online</label>
											<input type="radio" id="paymenttype1" name="paymentType"
												value="online" onclick="text(1)" />
										</div>
									</div>

									<div class="col">
										<div class="form-outline">
											<label class="form-label" for="form9Example2">Cash</label> <input
												type="radio" id="paymenttype2" name="paymentType"
												value="cash" onclick="text(0)" />
										</div>
									</div>
								</div>
								<div class="input-group " id="mycode">
									<div class="row mb-4">
										<div class="col">
											<div class="form-outline">
												<label for="cardtype" class="fw-bold">Card Type</label>
												 <select class="form-control"  name="cardType">
													<option value="">--selectcard--</option>
													<option value="Credit">Credit</option>
													<option value="Debit">Debit</option>

												</select>
											</div>
										</div>
										<div class="col">
											<div class="form-outline">
												<label class="form-label" for="typeEmail">Card
													Number</label> <input type="number" name="cardNumber"
													class="form-control " />
											</div>
										</div>
									</div>
									<div class="row mb-4">
										<div class="col">
											<div class="form-outline">
												<label class="form-label" for="form9Example6">Expiry
													Date</label> <input type="text" name="expiryDate"
													class="form-control input-custom" />
											</div>
										</div>
										<div class="col">
											<div class="form-outline">
												<label class="form-label" for="typeEmail">CVV Number</label>
												<input type="number" name="cvvNumber"
													class="form-control input-custom" />
											</div>
										</div>
									</div>
									<div class="float-center ">
										<!-- Submit button -->
										<button type="submit" class="btn btn-success btn-rounded"
											style="background-color: #44916e;">Pay Online</button>
									</div>
								</div>
								<div class="float-center mt-3">
									<!-- Submit button -->
									<button type="submit" class="btn btn-success btn-rounded"
										style="background-color: #c3a72a;">Cash On Delivery</button>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

         
		</div>
	
	</div>
</form>
<jsp:include page="../foot.jsp"></jsp:include>

</body>
</html>
/**
 * 
 */
package com.hotlearn.models;

/**
 * 
 */
public class OrderResquest {
	private String requestId;
	private String customerName;
	private String email;
	private String productId;
	private int quantity;
	private String message;

	/**
	 * 
	 */

	public OrderResquest(String requestId, String customerName, String email, String productId, int quantity,
			String message) {
		super();
		this.requestId = requestId;
		this.customerName = customerName;
		this.email = email;
		this.productId = productId;
		this.quantity = quantity;
		this.message = message;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


}

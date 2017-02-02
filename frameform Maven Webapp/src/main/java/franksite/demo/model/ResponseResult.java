package franksite.demo.model;

public class ResponseResult {

	// 状态
	private Boolean status;
	
	// 表示消息
	private String message;

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ResponseResult [status=" + status + ", message=" + message + "]";
	}

	public ResponseResult(Boolean status, String message) {
		super();
		this.status = status;
		this.message = message;
	}

	public ResponseResult() {
		super();
	} 
	
}

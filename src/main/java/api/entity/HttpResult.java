package api.entity;

public class HttpResult {
    /**
     * 状态码，推荐参考http响应码进行设置，以下是HTTP常见错误状态代码
     * 200：响应成功。
     * 400：错误的请求。客户端发送的HTTP请求不正确。
     * 404：文件不存在，在服务器上没有客户端请求访问的文档。
     * 405：服务器不支持客户端的请求方式。
     * 500：服务器内部错误。
     */
    private int state;
    /**
     * message为接口返回的个人编的提示消息；状态信息，返回错误的时候进行设置以方便调试。
     */
    private String message;
    /**
     * 具体数据
     */
    private Object data;

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}

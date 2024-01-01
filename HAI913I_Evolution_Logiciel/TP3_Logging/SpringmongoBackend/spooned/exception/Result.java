package exception;
public class Result {
    private boolean success;

    private String message;

    // constructeurs, getters, setters...
    public Result(boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    // serialisation
    @Override
    public String toString() {
        return ((((("Result{" + "success=") + success) + ", message='") + message) + '\'') + '}';
    }
}
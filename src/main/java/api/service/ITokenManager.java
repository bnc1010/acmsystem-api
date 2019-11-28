package api.service;


import api.entity.md.TokenModel;

/**
 * 对Token进行操作的接口
 */
public interface ITokenManager {

    /**
     * 创建一个 JWT token
     * @param userId 指定用户的id
     * @return 生成的token
     */
    String createToken(long userId);

    /**
     * 检查 JWT token是否有效
     * @param token token
     * @return 是否有效
     */
    boolean checkToken(String token);
}

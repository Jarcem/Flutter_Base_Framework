/// 第三方登录
enum EThirdType {
    /// 手机登录
    Mobile,
    /// 微信登录
    Wechat,
    /// qq登录
    QQ,
    /// 微博登录
    Weibo,
}

/// 短信验证码
enum ESmsCodeType {
    /// 登录
    Login,
    /// 更新
    Update,
    /// 创建星球
    Planet,
    /// 其他
    Other,
}
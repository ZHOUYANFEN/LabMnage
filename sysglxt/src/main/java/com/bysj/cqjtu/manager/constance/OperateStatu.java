package com.bysj.cqjtu.manager.constance;

/**
 * 插入表状态
 * @author fuzhengjun
 *2017年3月24日上午11:26:22
 *
 */
public interface OperateStatu {
    /************************插入用户表状态*******************/
    public static final String ADD_SY02_SUCCESS="21";//成功
    public static final String ADD_SY02_FAIL="20";//失败
    
    /************************插入学生表状态*******************/
    public static final String ADD_SY04_SUCCESS="41";//成功
    public static final String ADD_SY04_FAIL="40";//失败
    
    /************************插入教师表状态*******************/
    public static final String ADD_SY05_SUCCESS="51";//成功
    public static final String ADD_SY05_FAIL="50";//失败
    
    /************************插入科研人员吗表状态*******************/
    public static final String ADD_SY03_SUCCESS="31";//成功
    public static final String ADD_SY03_FAIL="30";//失败
    
    /************************查询用户状态*******************/
    public static final String QUERY_SY02_IN="22";//存在
    public static final String QUERY_SY02_NOTIN="23";//不存在
    
    /************************查询学生状态*******************/
    public static final String QUERY_SY04_IN="42";//存在
    public static final String QUERY_SY04_NOTIN="43";//不存在
    
    /************************查询教师状态*******************/
    public static final String QUERY_SY05_IN="52";//存在
    public static final String QUERY_SY05_NOTIN="53";//不存在
    
    /************************查询科研状态*******************/
    public static final String QUERY_SY03_IN="32";//存在
    public static final String QUERY_SY03_NOTIN="33";//不存在
    
    /**************************添加类型**********************/
    public static final int TYPE_STUDENT=1;//学生
    public static final int TYPE_TEACHER=2;//教师
    public static final int TYPE_TECHO=3;//科研人员
    public static final int TYPE_MANAGER=4;//管理员
    
    /*************************删除标记************************/
    public static final String DELETE_SUCCESS="1";//
    public static final String DELETE_FAIL="2";//
    
    /****************************导入文件列的数目*********/
    public static final int STUDENT_FILE_COLS=7;//
    public static final int TEACHER_FILE_COLS=6;//
    public static final int TECHO_FILE_COLS=5;//
    
    /***********************更新sy02状态****************/
    public static final String UPDATE_SY02_FAILE="24";//更新失败
    
    /***********************更新sy03状态****************/
    public static final String UPDATE_SY03_FAILE="34";//更新失败
    
    /***********************更新sy04状态****************/
    public static final String UPDATE_SY04_FAILE="44";//更新失败
    
    /***********************更新sy05状态****************/
    public static final String UPDATE_SY05_FAILE="54";//更新失败
    
    /***********************更新错误****************/
    public static final String UPDATE_FAIL="ERROR";//更新错误
    
    /***********************更新成功****************/
    public static final String UPDATE_USER_SUCCESS="25";//更新成功
    
    /*************************添加实验室信息***************/
    public static final String INSERT_SY11_SUCCESS="success";//成功
    public static final String INSERT_SY11_FAIL="error";//成功
    
    /*************************删除实验室信息***************/
    public static final String DELETE_SY11_SUCCESS="success";//成功
    public static final String DELETE_SY11_FAIL="error";//成功
    
    /*************************修改实验室信息***************/
    public static final String UPDATE_SY11_SUCCESS="success";//成功
    public static final String UPDATE_SY11_FAIL="error";//失败
    
    /*************************验证实验室类型是否存在***************/
    public static final String VALIDATE_SY10_SUCCESS="success";//成功
    public static final String VALIDATE_SY10_FAIL="error";//失败
    
    /************************添加实验室类型***************/
    public static final String INSERT_SY10_SUCCESS="success";//成功
    public static final String INSERT_SY10_FAIL="error";//失败
    
    /************************删除实验室类型***************/
    public static final String DELETE_SY10_SUCCESS="success";//成功
    public static final String DELETE_SY10_FAIL="error";//失败
    
    /************************是否删除实验室类型***************/
    public static final String VALIDATE_DELETE_SY10_SUCCESS="success";//可以删除
    public static final String VALIDATE_DELETE_SY10_FAIL="error";//不能删除
    
    /************************修改实验室类型***************/
    public static final String UPDATE_SY10_SUCCESS="success";//可以删除
    public static final String UPDATE_SY10_FAIL="error";//不能删除
    
    
    /************************验证实验室是否存在***************/
    public static final String VALIDATE_SY11_SUCCESS="success";//不存在
    public static final String VALIDATE_SY11_FAIL="error";//存在
    
    /************************验证输入的信息***************/
    public static final String VALIDATE_INPUT_SUCCESS="success";//不存在
    public static final String VALIDATE_INPUT_FAIL="error";//存在
}

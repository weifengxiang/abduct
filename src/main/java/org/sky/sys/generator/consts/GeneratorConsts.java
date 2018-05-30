package org.sky.sys.generator.consts;

/**
 * 数据库常量
 * 
 * @author
 * @date
 */
public interface GeneratorConsts {

	String DB_NAME = "abduct"; // 数据库名称
	String DB_HOST = "localhost"; // 数据库HOST
	int DB_PORT = 3306; // 数据库端口
	String DB_USER = "root"; // 用户名
	String DB_PASS = "root"; // 密码
	String DB_TABLE_PREFIX = ""; // 表前缀
	String TABLE_NAME = "SYS_AREA"; // 表名
	String TARGET_DIR = "jsp/sys/area/"; // 生成代码存放目录
	String URL_PREFIX="bkcx";//请求前缀
	String BASE_FOLDER="src/main/java/";//maven目录
	String BASE_PACKAGE="org.sky.sys";//生成java基础包名
}

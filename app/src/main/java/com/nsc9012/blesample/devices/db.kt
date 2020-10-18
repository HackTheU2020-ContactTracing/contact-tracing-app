package com.nsc9012.blesample.devices

import java.sql.*
import java.util.Properties
/**
 * Program to list databases in MySQL using Kotlin
 */
class DB {
    internal var conn: Connection? = null
    internal var username = "admin" // provide the username
    internal var password = "password" // provide the corresponding password

    fun executeMySQLQuery(query:String) {
        var stmt: Statement? = null
        var resultset: ResultSet? = null
        try {
            stmt = conn!!.createStatement()
            resultset = stmt!!.executeQuery(query)
            if (stmt.execute(query)) {
                resultset = stmt.resultSet
            }
            while (resultset!!.next()) {
                println(resultset.getString("query"))
            }
        } catch (ex: SQLException) {
            // handle any errors
            ex.printStackTrace()
        } finally {
            // release resources
            if (resultset != null) {
                try {
                    resultset.close()
                } catch (sqlEx: SQLException) {
                }
                resultset = null
            }
            if (stmt != null) {
                try {
                    stmt.close()
                } catch (sqlEx: SQLException) {
                }
                stmt = null
            }
            if (conn != null) {
                try {
                    conn!!.close()
                } catch (sqlEx: SQLException) {
                }
                conn = null
            }
        }
    }
    /**
     * This method makes a connection to MySQL Server
     * In this example, MySQL Server is running in the local host (so 127.0.0.1)
     * at the standard port 3306
     */
    fun getConnection() {
        val connectionProps = Properties()
        connectionProps.put("socketFactory", "com.google.cloud.sql.mysql.SocketFactory")
        connectionProps.put("cloudSqlInstance", "hacktheu-triangle-2020:us-west3:htu-triangle")
        connectionProps.put("user", username)
        connectionProps.put("password", password)
        try {
            Class.forName("com.google.cloud.sql.mysql.SocketFactory").newInstance()
            conn = DriverManager.getConnection(
                "jdbc:mysql:///covid",
                connectionProps)
        } catch (ex: SQLException) {
            // handle any errors
            ex.printStackTrace()
        } catch (ex: Exception) {
            // handle any errors
            ex.printStackTrace()
        }
    }
}
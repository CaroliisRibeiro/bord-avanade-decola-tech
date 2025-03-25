package br.com.dio;

import java.sql.SQLException;

import static br.com.dio.persistence.config.ConnectionConfig.getConnection;
import br.com.dio.persistence.migration.MigrationStrategy;
import br.com.dio.ui.MainMenu;


public class Main {

    public static void main(String[] args) throws SQLException {
        try(var connection = getConnection()){
            new MigrationStrategy(connection).executeMigration();
        }
        new MainMenu().execute();
    }

}

<?php
namespace App\Core;

use PDO;
use PDOStatement;
use Exception;

abstract class Database {
    private static ?PDO $pdo = null;
    protected static ?PDOStatement $cursor = null;
    
    private static ?string $tableName = null;
    private static array $tablesList = [];
    
    protected static function connect(): void {
        try {
            self::$pdo = new PDO('mysql:host=web.local;dbname=mvc_project;charset=utf-8', 'whitecat', 'sql');
            self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            self::$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch (Exception $err) {
            die("Une erreur est survenue lors de la connexion à la base de donnée.\nErreur: {$err->getMessage()}");
        }
    }

    protected static function sqlQuery(string $query, array $params = []): bool {
        if (!self::$tableName) {
            die("Aucune table n'a été sélectionnée pour la requête.");
        } else if (!self::$pdo) {
            self::connect();
        }
        
        try {
            self::$cursor = self::$pdo->prepare($query);
            self::bindDataValues($params);
            return self::$cursor->execute();
        } catch (Exception $err) {
            die("Une erreur est survenue lors de l'exécution de la requête suivante :\n- $query\nErreur : {$err->getMessage()}");
        }
    }
    
    private static function bindDataValues(array $params): void {
        foreach ($params as $placeholder => $value) {
            self::$cursor->bindValue($placeholder, $value, self::getBindType($value));
        }
    }
    
    public static function create(array $data): int {
        if (empty($data)) return false;
        
        $fields = implode(', ', array_keys($data));
        $placeholders = implode(', ', array_map(fn($v) => ":$v", array_keys($data)));
        $query = 'INSERT INTO ' . self::$tableName . " ($fields) VALUES ($placeholders);";
        
        self::sqlQuery($query, $data);
        return self::$pdo->lastInsertId();
    }
    
    public static function findAll(array $filters = []): array {
        $query = 'SELECT * FROM ' . self::$tableName . self::buildWhere($filters) . ';';
        self::sqlQuery($query);
        return self::$cursor->fetchAll();
    }
    
    public static function findByID(int $id): array {
        return self::findBy(['id' => $id]);
    }
    
    public static function findBy(array $filters): array {
        $query = 'SELECT * FROM ' . self::$tableName . self::buildWhere($filters) . ';';
        self::sqlQuery($query, $filters);
        return self::$cursor->fetch();
    }
    
    public static function updateByID(int $id, array $data) {
        return self::updateBy($data, ['id' => $id]);
    }
    
    public static function updateBy(array $data, array $filters): bool {
        $setters = implode(', ', array_map(fn($k) => "$k = :$k", array_keys($data)));
        $query = 'UPDATE ' . self::$tableName . " SET $setters" . self::buildWhere($filters) . ';';
        return self::sqlQuery($query, [...$data, ...$filters]);
    }
    
    public static function deleteByID(int $id): bool {
        return self::deleteBy(['id' => $id]);
    }
    
    public static function deleteBy(array $filters): bool {
        $query = 'DELETE FROM ' . self::$tableName . self::buildWhere($filters) . ';';
        return self::sqlQuery($query, $filters);
    }
    
    private static function tableExists(string $tableName): bool {
        self::setTablesList();
        return in_array($tableName, self::$tablesList);
    }
    
    private static function buildWhere(array $clauses): string {
        if (empty($clauses)) return '';
        
        $where = ' WHERE 1 = 1';
        $conditions = [];
        
        foreach ($clauses as $key => $value) {
            if (!is_null($value) && !empty(trim($value))) {
                $conditions[] = "$key = :$key";
            }
        }
        
        if (!empty($conditions)) {
            $where .= ' AND ' . implode(' AND ', $conditions);
        }
        return $where;
    }
    
    private static function clearCursor(): void {
        self::$cursor = null;
    }
    
    protected static function getCursor(): PDOStatement {
        return self::$cursor;
    }
    
    private static function getBindType($bindValue): int {
        return match (gettype($bindValue)) {
            'integer'   => PDO::PARAM_INT,
            'boolean'   => PDO::PARAM_BOOL,
            'NULL'      => PDO::PARAM_NULL,
            default     => PDO::PARAM_STR
        };
    }
    
    protected static function setTableName(string $tableName): void {
        if (!self::tableExists($tableName)) {
            die("La table $tableName n'existe pas dans la base de donnée.");
        }
        self::$tableName = $tableName;
    }
    
    private static function setTablesList(): void {
        if (empty(self::$tablesList)) {
            self::sqlQuery("SHOW TABLES;");
            self::$tablesList = array_map(fn($row) => array_values($row)[0], self::$cursor->fetchAll());
            self::clearCursor();
        }
    }
}
<?php

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * Get all PHP files in the project
     */
    private function getAllPHPFiles(): array
    {
        $files = [];
        
        // Root directory PHP files
        $files = array_merge($files, glob('*.php'));
        
        // Include subdirectories (optional)
        // $files = array_merge($files, glob('*/*.php'));
        // $files = array_merge($files, glob('**/*.php'));
        
        return $files;
    }

    /**
     * Test that all PHP files have valid syntax
     */
    public function testAllPHPFilesHaveValidSyntax(): void
    {
        $phpFiles = $this->getAllPHPFiles();
        
        $this->assertNotEmpty($phpFiles, 'No PHP files found in project');
        
        foreach ($phpFiles as $file) {
            // Check syntax without executing
            $output = shell_exec("php -l $file 2>&1");
            $this->assertStringContains('No syntax errors', $output, "Syntax error in $file: $output");
        }
    }

    /**
     * Test that all PHP files can be included
     */
    public function testAllPHPFilesCanBeIncluded(): void
    {
        $phpFiles = $this->getAllPHPFiles();
        $errors = [];
        
        foreach ($phpFiles as $file) {
            try {
                ob_start();
                include_once $file;
                ob_end_clean();
            } catch (Throwable $e) {
                ob_end_clean();
                $errors[] = "File $file: " . $e->getMessage();
            }
        }
        
        $this->assertEmpty($errors, "Errors found in files:\n" . implode("\n", $errors));
    }

    /**
     * Test specific files you know should exist
     */
    public function testRequiredFilesExist(): void
    {
        $requiredFiles = [
            'login.php',
            'index.php',
            'profile.php',
            'logout.php',
            'ajax_handlers.php',
            'budgets_actions.php',
            'collections_action.php',
            'db.php',
            'expense_functions.php',
            'expense_handler.php',
            'financial_budgeting_modals.php',
            'financial_budgeting.php',
            'financial_collections_modals.php',
            'financial_collections.php',
            'financial_expense_modals.php',
            'financial_expense.php',
            'financial_ledger_modals.php',
            'financial_ledger.php',
            'financial_reporting_modals.php',
            'financial_reporting.php',
            'financial_settings.php',
            'ledger_functions.php',
            'reporting_handler.php',
            'sidebar_navbar.php',
            'user_management.php',
            // 'dashboard.php',
            // 'profile.php',
            // 'logout.php',
        ];

        foreach ($requiredFiles as $file) {
            $this->assertFileExists($file, "Required file '$file' is missing");
        }
    }

    /**
     * Test that HTML files contain basic structure
     */
    public function testHTMLStructure(): void
    {
        $htmlFiles = $this->getAllPHPFiles();
        
        foreach ($htmlFiles as $file) {
            ob_start();
            include $file;
            $output = ob_get_clean();
            
            if (!empty($output)) {
                $this->assertTrue(
                    strpos($output, '<html') !== false || 
                    strpos($output, '<!DOCTYPE') !== false ||
                    strpos($output, '<form') !== false ||
                    strpos($output, '<div') !== false,
                    "File $file should contain HTML structure"
                );
            }
        }
    }

    /**
     * Count total PHP files in project
     */
    public function testProjectHasPHPFiles(): void
    {
        $phpFiles = $this->getAllPHPFiles();
        $count = count($phpFiles);
        
        echo "\nFound $count PHP files in project:\n";
        foreach ($phpFiles as $file) {
            echo "- $file\n";
        }
        
        $this->assertGreaterThan(0, $count, 'Project should have at least one PHP file');
    }
}




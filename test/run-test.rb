#!/usr/bin/env ruby

base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
code_dir = File.join(base_dir, "code")
test_dir = File.join(base_dir, "test")
$LOAD_PATH.unshift(code_dir)
$LOAD_PATH.unshift(test_dir)

require "yeah-test-utils"

exit Test::Unit::AutoRunner.run(true, test_dir)

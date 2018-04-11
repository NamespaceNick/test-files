# Makefile for test-files
help: 
	@echo "Clean commands:\n\tcclean cppclean pclean rclean shclean cleanall\n" 
	@echo "Build commands:\n\tc cpp python rust sh\n"
	@echo "Overwrite commands:\n\tsavecpp savec savep\n"
cclean:
	@rm -v ctest_file.c
	@cp clean-files/ctest_file.c .
	@echo "ctest_file.c cleaned.."

cppclean:
	@rm -v cpptest_file.cpp
	@cp clean-files/cpptest_file.cpp .
	@echo "cpptest_file.cpp cleaned.."

pclean:
	@rm -v ptest_file.py
	@cp clean-files/ptest_file.py .
	@echo "ptest_file.py cleaned.."

rclean:
	@rm -v rtest_file.rs
	@cp clean-files/rtest_file.rs .
	@echo "rtest_file.rs cleaned.."

shclean:
	@rm -v shtest_file.sh
	@cp clean-files/shtest_file.sh .
	@echo "shtest_file.sh cleaned.."

cleanall:
	@for file in `ls`; do [[ "$$file" != Makefile ]] && \
		[[ "$$file" != clean-files ]] && rm -rvf "$$file" ; done
	@for clean in `ls clean-files` ; do cp -v clean-files/"$$clean" . ; done
	@echo "All files successfully cleaned."

c:
	@gcc ctest_file.c -o ctest_file
	@./ctest_file
	@rm -v ctest_file

cpp:
	@g++ --std=c++1z cpptest_file.cpp -o cpptest_file
	@./cpptest_file
	@rm -v cpptest_file

python:
	@python3 ptest_file.py

python2:
	@python2 ptest_file.py

rust:
	@rustc rtest_file.rs
	@./rtest_file
	@rm -v rtest_file

sh:
	@bash shtest_file.sh

savecpp:
	@rm -v clean-files/cpptest_file.cpp
	@cp cpptest_file.cpp clean-files
	@echo "Saved current test cpp file to clean-files.."

savec:
	@rm -v clean-files/ctest_file.c
	@cp ctest_file.c clean-files
	@echo "Saved current test c file to clean-files.."

savep:
	@rm -v clean-files/ptest_file.py
	@cp ptest_file.py clean-files
	@echo "Saved current test py file to clean-files.."

.PHONY: cclean cppclean pclean rclean shclean cleanall c cpp \
	python rust sh savecpp savec savep

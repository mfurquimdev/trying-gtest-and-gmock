#-------------------------------------------------------------------------------
# Estrutura do projeto
# .
# ├── Makefile
# ├── obj
# └── src
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Nome do projeto
# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
#-------------------------------------------------------------------------------
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
NAME := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

#-------------------------------------------------------------------------------
# Diretórios
#-------------------------------------------------------------------------------
MAIN_SRC_DIR=./main/src
MAIN_INC_DIR=./main/inc
MAIN_OBJ_DIR=./main/obj

TEST_SRC_DIR=./test/src
TEST_INC_DIR=./test/inc
TEST_OBJ_DIR=./test/obj

BIN_DIR=./bin

#-------------------------------------------------------------------------------
# C, Header, Object and Mapping Files
#-------------------------------------------------------------------------------
MAIN_SRC = ${wildcard $(MAIN_SRC_DIR)/*.cpp}
TEST_SRC = ${wildcard $(TEST_SRC_DIR)/*.cpp}

MAIN_OBJ = ${addprefix $(MAIN_OBJ_DIR)/, ${notdir ${MAIN_SRC:.cpp=.o}}}
TEST_OBJ = ${addprefix $(TEST_OBJ_DIR)/, ${notdir ${TEST_SRC:.cpp=.o}}}
TEST_OBJ:= $(MAIN_OBJ)

MAIN_FUNC_OBJ = ${addprefix $(MAIN_OBJ_DIR)/, main.o}
TEST_OBJ:= $(filter-out $(MAIN_FUNC_OBJ), $(TEST_OBJ))

MAIN_INC = -I$(MAIN_INC_DIR)
TEST_INC = -I$(TEST_INC_DIR) $(MAIN_INC) 

#-------------------------------------------------------------------------------
# Compilador, flags e bibliotecas
#-------------------------------------------------------------------------------
CC=g++
CFLAGS= -Wall -Wextra -pedantic -ansi -std=c++11
LFLAGS= -lgtest -lgtest_main -lgmock 

MAIN_TARGET=$(BIN_DIR)/$(NAME)
TEST_TARGET=$(BIN_DIR)/$(NAME)_test

.PHONY: clean all main test main_dirs test_dirs run run_test run_disabled

all: main test

main: main_dirs
	@echo
	@echo Compiling...
	$(MAKE) $(MAIN_TARGET)

main_dirs:
	@mkdir -vp $(BIN_DIR)
	@mkdir -vp $(MAIN_OBJ_DIR)

$(MAIN_OBJ_DIR)/%.o: $(MAIN_SRC_DIR)/%.cpp
	@echo
	@echo Building $@
	$(CC) -c $^ -o $@ $(CFLAGS) $(MAIN_INC)

$(MAIN_TARGET): $(MAIN_OBJ)
	@echo
	@echo Linking $@
	$(CC) -o $@ $(MAIN_OBJ) $(LIB) $(LFLAGS)





test: test_dirs
	@echo
	@echo Compiling Test...
	$(MAKE) $(TEST_TARGET)
	$(MAKE) run_test

test_dirs: main_dirs
	@mkdir -vp $(TEST_OBJ_DIR)

$(TEST_OBJ_DIR)/%.o: $(TEST_SRC_DIR)/%.cpp
	@echo
	@echo Building $@
	$(CC) -c $^ -o $@ $(CFLAGS) $(TEST_INC)

$(TEST_TARGET): $(TEST_OBJ)
	@echo
	@echo Linking $@
	$(CC) -o $@ $(TEST_OBJ) $(LIB) $(LFLAGS)








run:
	$(MAIN_TARGET)

run_test:
	$(TEST_TARGET) --gtest_color=yes --gtest_repeat=1 --gtest_shuffle --gtest_print_time=0

run_disabled:
	$(TEST_TARGET) --gtest_color=yes --gtest_repeat=1 --gtest_shuffle --gtest_print_time=0 --gtest_also_run_disabled_tests

clean:
	@echo Cleaning...
	rm -rvf $(MAIN_OBJ_DIR) $(TEST_OBJ_DIR) $(BIN_DIR)

.PRECIOUS: %.o

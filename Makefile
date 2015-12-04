INC_DIR=src/include/falconn
TEST_DIR=src/test
GTEST_DIR=external/googletest/googletest
TEST_BIN_DIR=test_bin
DOC_DIR=doc

ALL_HEADERS = $(INC_DIR)/core/lsh_table.h $(INC_DIR)/core/cosine_distance.h $(INC_DIR)/core/composite_hash_table.h $(INC_DIR)/core/stl_hash_table.h $(INC_DIR)/core/polytope_hash.h $(INC_DIR)/core/flat_hash_table.h $(INC_DIR)/core/probing_hash_table.h $(INC_DIR)/core/hyperplane_hash.h $(INC_DIR)/core/heap.h $(INC_DIR)/core/prefetchers.h $(INC_DIR)/core/incremental_sorter.h $(INC_DIR)/core/lsh_function_helpers.h $(INC_DIR)/core/hash_table_helpers.h $(INC_DIR)/core/data_storage.h $(INC_DIR)/core/nn_query.h $(INC_DIR)/lsh_nn_table.h $(INC_DIR)/wrapper/cpp_wrapper_impl.h $(INC_DIR)/falconn_global.h $(TEST_DIR)/test_utils.h 

CXX=g++
CXXFLAGS=-std=c++11 -DNDEBUG -Wall -Wextra -march=native -O3 -fPIC -I external/eigen -I src/include

clean:
	rm -f obj/*.o
	rm -f $(TEST_BIN_DIR)/*_test
	rm -rf $(DOC_DIR)/html

docs: $(ALL_HEADERS) $(DOC_DIR)/Doxyfile
	doxygen $(DOC_DIR)/Doxyfile

obj/gtest-all.o: $(GTEST_DIR)/src/gtest-all.cc
	mkdir -p obj
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -I $(GTEST_DIR) -c -o $@ $<

obj/gtest_main.o: $(GTEST_DIR)/src/gtest_main.cc
	mkdir -p obj
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o $@ $<

$(TEST_BIN_DIR)/cosine_distance_test: $(TEST_DIR)/cosine_distance_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/cosine_distance_test.o $(TEST_DIR)/cosine_distance_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/cosine_distance_test obj/gtest_main.o obj/gtest-all.o obj/cosine_distance_test.o -pthread

$(TEST_BIN_DIR)/flat_hash_table_test: $(TEST_DIR)/flat_hash_table_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/flat_hash_table_test.o $(TEST_DIR)/flat_hash_table_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/flat_hash_table_test obj/gtest_main.o obj/gtest-all.o obj/flat_hash_table_test.o -pthread

$(TEST_BIN_DIR)/probing_hash_table_test: $(TEST_DIR)/probing_hash_table_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/probing_hash_table_test.o $(TEST_DIR)/probing_hash_table_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/probing_hash_table_test obj/gtest_main.o obj/gtest-all.o obj/probing_hash_table_test.o -pthread

$(TEST_BIN_DIR)/stl_hash_table_test: $(TEST_DIR)/stl_hash_table_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/stl_hash_table_test.o $(TEST_DIR)/stl_hash_table_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/stl_hash_table_test obj/gtest_main.o obj/gtest-all.o obj/stl_hash_table_test.o -pthread

$(TEST_BIN_DIR)/composite_hash_table_test: $(TEST_DIR)/composite_hash_table_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/composite_hash_table_test.o $(TEST_DIR)/composite_hash_table_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/composite_hash_table_test obj/gtest_main.o obj/gtest-all.o obj/composite_hash_table_test.o -pthread

$(TEST_BIN_DIR)/polytope_hash_test: $(TEST_DIR)/polytope_hash_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/polytope_hash_test.o $(TEST_DIR)/polytope_hash_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/polytope_hash_test obj/gtest_main.o obj/gtest-all.o obj/polytope_hash_test.o -pthread

$(TEST_BIN_DIR)/hyperplane_hash_test: $(TEST_DIR)/hyperplane_hash_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/hyperplane_hash_test.o $(TEST_DIR)/hyperplane_hash_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/hyperplane_hash_test obj/gtest_main.o obj/gtest-all.o obj/hyperplane_hash_test.o -pthread

$(TEST_BIN_DIR)/lsh_table_test: $(TEST_DIR)/lsh_table_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/lsh_table_test.o $(TEST_DIR)/lsh_table_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/lsh_table_test obj/gtest_main.o obj/gtest-all.o obj/lsh_table_test.o -pthread

$(TEST_BIN_DIR)/heap_test: $(TEST_DIR)/heap_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/heap_test.o $(TEST_DIR)/heap_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/heap_test obj/gtest_main.o obj/gtest-all.o obj/heap_test.o -pthread

$(TEST_BIN_DIR)/incremental_sorter_test: $(TEST_DIR)/incremental_sorter_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/incremental_sorter_test.o $(TEST_DIR)/incremental_sorter_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/incremental_sorter_test obj/gtest_main.o obj/gtest-all.o obj/incremental_sorter_test.o -pthread

$(TEST_BIN_DIR)/nn_query_test: $(TEST_DIR)/nn_query_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/nn_query_test.o $(TEST_DIR)/nn_query_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/nn_query_test obj/gtest_main.o obj/gtest-all.o obj/nn_query_test.o -pthread

$(TEST_BIN_DIR)/cpp_wrapper_test: $(TEST_DIR)/cpp_wrapper_test.cc $(ALL_HEADERS) obj/gtest-all.o obj/gtest_main.o
	mkdir -p $(TEST_BIN_DIR)
	$(CXX) $(CXXFLAGS) -I $(GTEST_DIR)/include -c -o obj/cpp_wrapper_test.o $(TEST_DIR)/cpp_wrapper_test.cc
	$(CXX) $(CXXFLAGS) -o $(TEST_BIN_DIR)/cpp_wrapper_test obj/gtest_main.o obj/gtest-all.o obj/cpp_wrapper_test.o -pthread

run_all_tests: $(TEST_BIN_DIR)/cosine_distance_test $(TEST_BIN_DIR)/flat_hash_table_test $(TEST_BIN_DIR)/probing_hash_table_test $(TEST_BIN_DIR)/stl_hash_table_test $(TEST_BIN_DIR)/composite_hash_table_test $(TEST_BIN_DIR)/polytope_hash_test $(TEST_BIN_DIR)/hyperplane_hash_test $(TEST_BIN_DIR)/lsh_table_test $(TEST_BIN_DIR)/heap_test $(TEST_BIN_DIR)/incremental_sorter_test $(TEST_BIN_DIR)/nn_query_test $(TEST_BIN_DIR)/cpp_wrapper_test
	./$(TEST_BIN_DIR)/cosine_distance_test
	./$(TEST_BIN_DIR)/flat_hash_table_test
	./$(TEST_BIN_DIR)/probing_hash_table_test
	./$(TEST_BIN_DIR)/stl_hash_table_test
	./$(TEST_BIN_DIR)/composite_hash_table_test
	./$(TEST_BIN_DIR)/polytope_hash_test
	./$(TEST_BIN_DIR)/hyperplane_hash_test
	./$(TEST_BIN_DIR)/lsh_table_test
	./$(TEST_BIN_DIR)/heap_test
	./$(TEST_BIN_DIR)/incremental_sorter_test
	./$(TEST_BIN_DIR)/nn_query_test
	./$(TEST_BIN_DIR)/cpp_wrapper_test

set(SEAHORN_LLVM_SOURCE_DIR "${CMAKE_SOURCE_DIR}/llvm-seahorn" CACHE STRING "seahorn-llvm source directory")
if (TopLevel)
  add_custom_target(seahorn-llvm-git)
endif()

cmake_minimum_required(VERSION 3.2)

project(libodb-sqlite VERSION 2.4.0 LANGUAGES CXX)

if(MSVC)
  set(CMAKE_DEBUG_POSTFIX d)
endif()

find_package(libodb REQUIRED NO_MODULE)
find_package(sqlite3 REQUIRED NO_MODULE)

add_library(libodb-sqlite
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/traits.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/traits.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/traits-calls.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/transaction.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/transaction.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/transaction.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/transaction-impl.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/transaction-impl.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/transaction-impl.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/version.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/view-result.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/view-result.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/view-statements.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/view-statements.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/auto-handle.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/binding.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/config.h.in
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/connection.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/connection.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/connection.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/connection-factory.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/connection-factory.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/container-statements.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/container-statements.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/database.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/database.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/database.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/error.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/error.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/exceptions.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/exceptions.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/forward.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/no-id-object-result.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/no-id-object-result.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/no-id-object-statements.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/no-id-object-statements.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/polymorphic-object-result.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/polymorphic-object-result.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/polymorphic-object-statements.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/polymorphic-object-statements.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/prepared-query.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/prepared-query.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query-const-expr.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query-dynamic.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query-dynamic.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query-dynamic.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/query-dynamic.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/section-statements.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/section-statements.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/simple-object-result.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/simple-object-result.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/simple-object-statements.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/simple-object-statements.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/simple-object-statements.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/simple-object-statements.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/sqlite-types.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statement.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statement.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statement-cache.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statement-cache.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statement-cache.txx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statements-base.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/statements-base.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/tracer.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/tracer.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/options.cli
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/options.cxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/options.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/options.ixx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/config.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/conversion.hxx
${CMAKE_CURRENT_SOURCE_DIR}/odb/sqlite/details/export.hxx
)

target_include_directories(libodb-sqlite
  PRIVATE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
  INTERFACE
  $<INSTALL_INTERFACE:include/odb>
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/odb>
)

target_compile_definitions(libodb-sqlite
  PRIVATE
  _CRT_SECURE_NO_WARNINGS
  _CRT_STDC_NO_DEPRECATE
  _USRDLL
  LIBODB_SQLITE_DYNAMIC_LIB
  LIBODB_SQLITE_HAVE_UNLOCK_NOTIFY
)

target_link_libraries(libodb-sqlite
  PRIVATE
  libodb::libodb
  sqlite3::sqlite3
)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY AnyNewerVersion
)

install(TARGETS libodb-sqlite EXPORT libodb-sqlite
  RUNTIME DESTINATION bin
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
)

install(DIRECTORY
  ${CMAKE_CURRENT_SOURCE_DIR}/odb
  DESTINATION include
  PATTERN *.cxx EXCLUDE
)

install(EXPORT libodb-sqlite
  FILE
  ${PROJECT_NAME}.cmake
  NAMESPACE
    ${PROJECT_NAME}::
  DESTINATION
    lib/cmake/${PROJECT_NAME}
)

install(FILES
  cmake/${PROJECT_NAME}-config.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
  DESTINATION
    lib/cmake/${PROJECT_NAME}
)

export(TARGETS libodb-sqlite
  FILE
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake
  NAMESPACE ${PROJECT_NAME}::
)

if(MSVC AND BUILD_SHARED_LIBS)
  install(FILES
    $<TARGET_PDB_FILE:${PROJECT_NAME}>
    DESTINATION lib
  )
endif()
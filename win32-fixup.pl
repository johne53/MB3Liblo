#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

require "../local-paths.lib";

$version_string = "\"0.28\"";
$package_string = "\"liblo 0.28\"";
$liblo_version = "0.28";
$major = 0;
$minor = 28;
$micro = 0;
$binary_age = 2800;
$current_minus_age = 0;
$gettext_package = "liblo";
$lib_pthread = "-lpthread";
$extra_libs = "";
$exec_prefix = "lib";
$def_threads = "";
$enable_threads = 1;
$lo_so_version = "{9, 0, 2}";
# The above numbers can be generated by running "premake4 vs2005"

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@VERSION@/$version_string/g;
	    s/\@PACKAGE_VERSION@/$version_string/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@LIBLO_VERSION@/$liblo_version/g;
	    s/\@LIBLO_API_VERSION@/$liblo_version/g;
	    s/\@LIBLO_MAJOR_VERSION\@/$major/g;
	    s/\@LIBLO_MINOR_VERSION\@/$minor/g;
	    s/\@LIBLO_MICRO_VERSION\@/$micro/g;
	    s/\@LIBLO_BINARY_AGE\@/$binary_age/g;
	    s/\@DLL_NAME\@/$gettext_package/g;
	    s/\@GETTEXT_PACKAGE\@/$gettext_package/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@DEFTHREADS@/$def_threads/g;
	    s/\@ENABLE_THREADS\@/$enable_threads/g;
	    s/\@LIBPTHREAD@/$lib_pthread/g;
	    s/\@extralibs@/$extra_libs/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@PangoBuildProjectFolder@/$pango_build_project_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@GenericWin64LibraryFolder@/$generic_win64_library_folder/g;
	    s/\@GenericWin64BinaryFolder@/$generic_win64_binary_folder/g;
	    s/\@Debug64TestSuiteFolder@/$debug64_testsuite_folder/g;
	    s/\@Release64TestSuiteFolder@/$release64_testsuite_folder/g;
	    s/\@Debug64TargetFolder@/$debug64_target_folder/g;
	    s/\@Release64TargetFolder@/$release64_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@prefix@/$prefix/g;
	    s/\@exec_prefix@/$exec_prefix/g;
	    s/\@includedir@/$generic_include_folder/g;
	    s/\@libdir@/$generic_library_folder/g;
	    s/\@LO_SO_VERSION@/$lo_so_version/g;
	    print OUTPUT;
	}
}

process_file ("liblo.pc");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("config.h");
	process_file ("lo/lo.h");
	process_file ("src/liblo.def");
	process_file ("build/msvc/liblo.props");
	process_file ("build/msvc/liblo.vsprops");
}
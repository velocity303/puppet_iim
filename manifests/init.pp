class iim (
  $temp_dir    = undef,
  $install_dir = undef,
  $im_user     = undef,
  $im_group    = undef,
  $installer   = undef,
) {
    exec {'imcl install':
    command => "${temp_dir}/tools/imcl install com.ibm.cic.agent -repositories ${temp_dir}/repository.config -installationDirectory ${install_dir}/IBM/InstallationManager/eclipse -accessRights nonadmin -acceptLicense",
    creates => "${install_dir}/IBM",
    user    => $im_user,
    require => [ User[ $im_user ],
    Staging::Extract [ $installer ] ] ,
  }
}

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"[;|.U~9e:oy;Z[9HD?yQ0VP@tzR]+^|<5QToVo1=<V0/m[]*CIm*M_5D:PFj.gYy"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"[;|.U~9e:oy;Z[9HD?yQ0VP@tzR]+^|<5QToVo1=<V0/m[]*CIm*M_5D:PFj.gYy"
end

release :octochat do
  set version: current_version(:octochat)
end

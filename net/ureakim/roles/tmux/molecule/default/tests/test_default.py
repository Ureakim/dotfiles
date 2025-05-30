def test_package_is_installed(host):
    pkg = host.package("tmux")
    assert pkg.is_installed


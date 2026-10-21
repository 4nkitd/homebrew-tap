class BrotherDcpL2520d < Formula
  desc "Native Apple silicon CUPS driver for the Brother DCP-L2520D"
  homepage "https://github.com/4nkitd/brother-dcp-l2520d-mac-driver"
  url "https://github.com/4nkitd/brother-dcp-l2520d-mac-driver/releases/download/v0.1.0/brother-dcp-l2520d-0.1.0.tar.gz"
  sha256 "f7e75ed6603608d758cbc974ccae8cd1240c7c60c939e7007cc9adc162d774ed"
  license "GPL-3.0-or-later"
  head "https://github.com/4nkitd/brother-dcp-l2520d-mac-driver.git", branch: "main"

  depends_on "cmake" => :build
  depends_on arch: :arm64

  def install
    system "./build.sh"

    libexec.install "out/rastertobrlaser"
    libexec.install "out/brl2520d.ppd"
    libexec.install "install.sh"
    libexec.install "uninstall.sh"
    libexec.install "VERSION"

    (bin/"brother-dcp-l2520d-install").write <<~SH
      #!/bin/sh
      exec env BUILD_DIR="#{opt_libexec}" "#{opt_libexec}/install.sh" "$@"
    SH

    (bin/"brother-dcp-l2520d-uninstall").write <<~SH
      #!/bin/sh
      exec "#{opt_libexec}/uninstall.sh" "$@"
    SH

    chmod 0755, bin/"brother-dcp-l2520d-install"
    chmod 0755, bin/"brother-dcp-l2520d-uninstall"
  end

  def caveats
    <<~EOS
      The driver installs into the system CUPS directory, which needs administrator
      rights. Finish the install by running:

        sudo #{opt_bin}/brother-dcp-l2520d-install

      Make sure the printer is connected by USB and switched on before you do.

      To remove the driver later:

        sudo #{opt_bin}/brother-dcp-l2520d-uninstall
    EOS
  end

  test do
    assert_predicate libexec/"rastertobrlaser", :executable?
    assert_equal "arm64", shell_output("lipo -archs #{libexec}/rastertobrlaser").strip
    assert_path_exists libexec/"brl2520d.ppd"
  end
end

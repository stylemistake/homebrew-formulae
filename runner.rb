class Runner < Formula
  desc "Task runner for bash"
  homepage "https://github.com/stylemistake/runner"
  url "https://github.com/stylemistake/runner/archive/v0.7.1.tar.gz"
  sha256 "06885310234788eef7416615cc92681f09e1a8d6f97ece08e9a863fb57e60039"

  def install
    prefix.install "src"
    prefix.install "completion"
    bin.install "bin/runner"
  end

  test do
    (testpath/"Runnerfile").write(%{
      task_foo() { echo "Hello, foo!" }
      task_default() { runner_sequence foo }
    })
    system bin/"runner"
  end
end

class Runner < Formula
  desc "Task runner for bash"
  homepage "https://github.com/stylemistake/runner"
  url "https://github.com/stylemistake/runner/archive/v0.8.0.tar.gz"
  sha256 "0b8e0dd41c42a278fc6b78a83ff4f2933317e153bf53ef2d4c07fb36de4bf8fe"

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

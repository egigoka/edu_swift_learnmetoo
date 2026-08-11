#!/usr/bin/env python3

import subprocess
import sys
from datetime import datetime, timedelta


def run(*args: str, capture_output: bool = False) -> str:
    result = subprocess.run(
        args,
        check=True,
        text=True,
        capture_output=capture_output,
    )
    return result.stdout.strip() if capture_output else ""


def format_duration(commit_count: int) -> str:
    hours, minutes = divmod(commit_count * 15, 60)
    if hours and minutes:
        return f"{hours}h {minutes}m"
    if hours:
        return f"{hours}h"
    return f"{minutes}m"


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(f"Usage: {sys.argv[0]} COMMIT MESSAGE")

    if not run(
        "git",
        "status",
        "--porcelain",
        "--",
        "progress.txt",
        capture_output=True,
    ):
        raise SystemExit("progress.txt has no changes; nothing committed")

    commit_message = " ".join(sys.argv[1:])

    run("git", "add", ".")
    run("git", "commit", "-m", commit_message)
    run("git", "push")

    now = datetime.now().astimezone()
    week_start = (now - timedelta(days=now.weekday())).replace(
        hour=0,
        minute=0,
        second=0,
        microsecond=0,
    )
    commit_count = int(
        run(
            "git",
            "rev-list",
            "--count",
            f"--since={week_start.isoformat()}",
            f"--until={now.isoformat()}",
            "HEAD",
            capture_output=True,
        )
    )

    print(f"{commit_count} - {format_duration(commit_count)}")


if __name__ == "__main__":
    main()

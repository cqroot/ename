#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest
from ename import RenameOptions, filter_files, gen_rename_pairs


class TestEname(unittest.TestCase):
    def test_filter_files(self):
        self.assertListEqual(filter_files("testdata"), ["test_dir", "test_file"])
        self.assertListEqual(
            filter_files("testdata", RenameOptions(show_hidden_files=True)),
            [".test_hidden_file", "test_dir", "test_file"],
        )
        self.assertListEqual(
            filter_files("testdata", RenameOptions(file_only=True)), ["test_file"]
        )
        self.assertListEqual(
            filter_files("testdata", RenameOptions(directory_only=True)), ["test_dir"]
        )

    def test_gen_rename_pairs(self):
        ret, pairs = gen_rename_pairs(["a", "b", "c"], ["a", "b", "c"])
        self.assertEqual(ret, 0)
        self.assertListEqual(pairs, [])

        ret, pairs = gen_rename_pairs(["a", "b", "c"], ["a", "_b", "c"])
        self.assertEqual(ret, 0)
        self.assertListEqual(pairs, [{"old": "b", "new": "_b"}])

        ret, pairs = gen_rename_pairs(["a", "b", "c"], ["b", "c"])
        self.assertEqual(ret, 1)
        self.assertListEqual(pairs, [])


if __name__ == "__main__":
    unittest.main()

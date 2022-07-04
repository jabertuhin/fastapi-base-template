import pytest

from app.service.implementation.string_service import StringServiceImplementation


def test_concate_when_two_valid_strings_should_return_concatenated_string():
    str1 = "abc"
    str2 = "edf"
    expected = "abcedf"

    string_service_implementation = StringServiceImplementation()

    actual = string_service_implementation.concatenate(str1, str2)

    assert expected == actual

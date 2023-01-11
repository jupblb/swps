#!/usr/bin/env python3

import csv
from dataclasses import dataclass
from enum import IntEnum
from math import sqrt
from statistics import fmean


class Category(IntEnum):
    LOW = 1
    MEDIUM = 2
    HIGH = 3


@dataclass
class Result:
    past_negative: Category
    past_negative_raw: float

    past_positive: Category
    past_positive_raw: float

    present_fatalism: Category
    present_fatalism_raw: float

    present_hedonism: Category
    present_hedonism_raw: float

    future: Category
    future_raw: float

    physical_activity: Category
    total_met: float

    # Metrics
    sex: int
    age: int
    population: int
    education: int
    physical_activity_level: int
    physical_activity_importance: int


    def is_medium(self) -> bool:
        return (
            self.past_negative == Category.MEDIUM
            and self.past_positive == Category.MEDIUM
            and self.present_fatalism == Category.MEDIUM
            and self.present_hedonism == Category.MEDIUM
            and self.future == Category.MEDIUM
            and self.physical_activity == Category.MEDIUM
        )

    def dbtp_raw(self) -> float:
        return sqrt(
            (1.95 - past_negative_raw) ** 2
            + (4.6 - past_positive_raw) ** 2
            + (1.5 - present_fatalism_raw) ** 2
            + (3.9 - present_hedonism_raw) ** 2
            # + (??? - future_raw) ** 2
        )


def zimbardo_to_result(answers: list[int]) -> tuple[float, Category]:
    mean = fmean(answers)

    if mean <= 2.0:
        return mean, Category.LOW
    if mean >= 4.0:
        return mean, Category.HIGH
    return mean, Category.MEDIUM


def calculate_past_negative(row: dict[str, str]) -> tuple[float, Category]:
    questions = [
        "Q3_4",
        "Q3_5",
        "Q3_16",
        "Q3_22",
        "Q3_27",
        "Q3_33",
        "Q3_34",
        "Q3_36",
        "Q3_50",
        "Q3_54",
    ]
    return zimbardo_to_result([int(row[q]) for q in questions])


def calculate_past_positive(row: dict[str, str]) -> tuple[float, Category]:
    questions = [
        "Q3_2",
        "Q3_7",
        "Q3_11",
        "Q3_15",
        "Q3_20",
        "Q3_29",
        "Q3_49",
    ]
    questions_r = [
        "Q3_25",
        "Q3_41",
    ]
    return zimbardo_to_result(
        [int(row[q]) for q in questions] + [6 - int(row[q]) for q in questions_r]
    )


def calculate_present_fatalism(row: dict[str, str]) -> tuple[float, Category]:
    questions = [
        "Q3_3",
        "Q3_14",
        "Q3_35",
        "Q3_37",
        "Q3_38",
        "Q3_39",
        "Q3_47",
        "Q3_52",
        "Q3_53",
    ]
    return zimbardo_to_result([int(row[q]) for q in questions])


def calculate_present_hedonism(row: dict[str, str]) -> tuple[float, Category]:
    questions = [
        "Q3_1",
        "Q3_8",
        "Q3_12",
        "Q3_17",
        "Q3_19",
        "Q3_23",
        "Q3_26",
        "Q3_28",
        "Q3_31",
        "Q3_32",
        "Q3_42",
        "Q3_44",
        "Q3_46",
        "Q3_48",
        "Q3_55",
    ]
    return zimbardo_to_result([int(row[q]) for q in questions])


def calculate_future(row: dict[str, str]) -> tuple[float, Category]:
    questions = [
        "Q3_6",
        "Q3_10",
        "Q3_13",
        "Q3_18",
        "Q3_21",
        "Q3_30",
        "Q3_40",
        "Q3_43",
        "Q3_45",
        "Q3_51",
    ]
    questions_r = [
        "Q3_9",
        "Q3_24",
        "Q3_56",
    ]
    return zimbardo_to_result(
        [int(row[q]) for q in questions] + [6 - int(row[q]) for q in questions_r]
    )


def calculate_physical_activity(row: dict[str, str | None]) -> tuple[float, Category]:
    match row["Pytanie 1_1_TEXT"]:
        case None | "":
            intensive_days = 0
        case s:
            intensive_days = int(s)

    match row["Pytanie 2_1_TEXT"]:
        case None | "":
            intensive_minutes = 0
        case "60min" | "1h":
            intensive_minutes = 60
        case "ok 90" | "1.5 h":
            intensive_minutes = 90
        case "2h":
            intensive_minutes = 2 * 60
        case "90-180":
            intensive_minutes = (90 + 180) / 2
        case "Ok. 3 godziny ":
            intensive_minutes = 3 * 60
        case "4 godziny" | "4h":
            intensive_minutes = 4 * 60
        case s:
            intensive_minutes = int(s)
    intensive_minutes_met = intensive_minutes * 8

    match row["Pytanie 3_1_TEXT"]:
        case "Codziennie ":
            moderate_days = 7
        case "1h" | "" | None:
            moderate_days = 0
        case s:
            moderate_days = int(s)

    match row["Pytanie 4_1_TEXT"]:
        case "" | None:
            moderate_minutes = 0
        case "20 minut":
            moderate_minutes = 20
        case "30 min":
            moderate_minutes = 30
        case "45min":
            moderate_minutes = 45
        case "60min" | "1h":
            moderate_minutes = 60
        case "60-120":
            moderate_minutes = (60 + 120) / 2
        case "2h":
            moderate_minutes = 2 * 60
        case "Ok. 3 godziny ":
            moderate_minutes = 3 * 60
        case "6h":
            moderate_minutes = 6 * 60
        case s:
            moderate_minutes = int(s)
    moderate_minutes_met = moderate_minutes * 4

    match row["Q15_1_TEXT"]:
        case "Codziennie ":
            light_days = 7
        case "20" | "45" | "" | None:
            light_days = 0
        case "5 dni ":
            light_days = 5
        case s:
            light_days = int(s)

    match row["Q16_1_TEXT"]:
        case "" | None | "2/3":
            light_minutes = 0
        case "Ok. 20 minut ":
            light_minutes = 20
        case "30 min.":
            light_minutes = 30
        case "60 minut":
            light_minutes = 60
        case "1,5 godziny ":
            light_minutes = 1.5 * 60
        case "120min" | "2h":
            light_minutes = 120
        case "3 godziny":
            light_minutes = 3 * 60
        case "4h":
            light_minutes = 4 * 60
        case s:
            light_minutes = int(s)
    light_minutes_met = light_minutes * 3.3

    any_activity_days = intensive_days + moderate_days + light_days
    total_met = intensive_minutes_met + moderate_minutes_met + light_minutes_met

    if (intensive_days >= 7 and total_met >= 1500) or (
        any_activity_days >= 5 and total_met >= 3000
    ):
        return total_met, Category.HIGH

    if (
        (intensive_days >= 3 and intensive_minutes >= 20)
        or (
            moderate_days + light_days >= 5
            and (moderate_minutes >= 30 or light_minutes >= 30)
        )
        or (any_activity_days >= 5 and total_met >= 600)
    ):
        return total_met, Category.MEDIUM

    return total_met, Category.LOW


results: list[Result | None] = []

# Remove the first two lines of the file manually
with open("source.csv", "r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        if row["Finished"] == "0":
            results.append(None)
            continue

        past_negative_raw, past_negative = calculate_past_negative(row)
        past_positive_raw, past_positive = calculate_past_positive(row)
        present_fatalism_raw, present_fatalism = calculate_present_fatalism(row)
        present_hedonism_raw, present_hedonism = calculate_present_hedonism(row)
        future_raw, future = calculate_future(row)
        total_met, physical_activity = calculate_physical_activity(row)

        results.append(
            Result(
                past_negative,
                past_negative_raw,
                past_positive,
                past_positive_raw,
                present_fatalism,
                present_fatalism_raw,
                present_hedonism,
                present_hedonism_raw,
                future,
                future_raw,
                physical_activity,
                total_met,
                int(row["Q20"]),
                int(row["Q22"]),
                int(row["Q21"]),
                int(row["Q23"]),
                int(row["Q32_1"]),
                int(row["Q32_2"]),
            )
        )

with open("results.csv", "w") as file:
    writer = csv.DictWriter(
        file,
        fieldnames=results[0].__dict__.keys(),
    )
    writer.writeheader()
    for result in results:
        if result:
            writer.writerow(result.__dict__)

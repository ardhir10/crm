<?php

namespace App\Imports;

use App\Test;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

//TAMBAHKAN CODE INI

class TestImport implements ToModel, WithHeadingRow// USE CLASS YANG DIIMPORT

{
    public function model(array $row)
    {
        // dd($row);
        if (!isset($row['description'])) {
            return null;
        }
        return new Test([
            'value' => $row['description'],
            'value2' => $row['type'],
            'value3' => $row['mfg'],
            'value4' => $row['unit'],
            'value5' => $row['price'],
            'value6' => $row['disc'],
        ]);
    }
}

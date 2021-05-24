<?php

namespace App\Imports;

use App\Item;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

//TAMBAHKAN CODE INI

class ImportItem implements ToModel, WithHeadingRow// USE CLASS YANG DIIMPORT

{
    public function model(array $row)
    {
        if (!isset($row['description'])) {
            return null;
        }
        return new Item([
            'description' => $row['description'],
            'type' => $row['type'],
            'mfg' => $row['mfg'],
            'unit' => $row['unit'],
            'price' => $row['price'],
            'disc' => $row['disc'],
        ]);
    }
}

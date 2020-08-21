package com.wbg.swager.dao;

import com.wbg.swager.entity.Pet;
import java.util.List;

public interface PetMapper {

    int deleteByPrimaryKey(String id);

    int insert(Pet record);
    Pet selectByPrimaryKey(String id);

    int updateNameStatus(Pet pet);
    List<Pet> selectAll();

    List<Pet> findByStatus(String Status);
    int updateByPrimaryKey(Pet record);
}
package models


type User struct{
	Id int64 `orm:"column(userid);pk;auto"`
	Name string `orm:"column(name);size(30);not null"`
	Cellphone string `orm:"columne(cellphone);size(11);null"`
}

func (this *User) TableName() string {
	return "user"
}